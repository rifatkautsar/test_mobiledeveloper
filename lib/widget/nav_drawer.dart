import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/components/constant_text.dart';
import 'package:test_mobiledeveloper/screens/Barang/item_barang.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/item_transaksi.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/list_transaksi.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/no_data.dart';

import '../provider/barang_provider.dart';
import '../provider/transaksi_provider.dart';
import '../screens/Barang/list_barang_page.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  int _selectedIndex = 0;
  String? _title;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  static const List<Widget> _widgetOptions = <Widget>[
    TransaksiPage(),
    ListBarangPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transaksiProvider = Provider.of<TransaksiProvider>(context);
    final barangProvider = Provider.of<BarangProvider>(context);
    _title = _selectedIndex == 0 ? 'Transaksi' : 'Barang';
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        backgroundColor: ColorConstant.blueColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              isSearching ? Icons.arrow_back : Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              if (isSearching) {
                setState(() {
                  isSearching = false;
                  searchController.clear();
                });
              } else {
                Scaffold.of(context).openDrawer();
              }
            },
          ),
        ),
        title: isSearching
            ? TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) async {
                  if (_selectedIndex == 0) {
                    await transaksiProvider.loadTransaksi(searchQuery: value);
                  } else if (_selectedIndex == 1) {
                    await barangProvider.loadBarang(searchQuery: value);
                  }
                },
              )
            : CustomTextColor(color: Colors.white, text: _title!, size: 18),
        actions: [
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchController.clear();
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                ),
        ],
      ),
      body: Center(
        child: (() {
          if (searchController.text.isEmpty) {
            return _widgetOptions[_selectedIndex];
          } else {
            if (_selectedIndex == 0) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildTransaksiList(transaksiProvider),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildBarangList(barangProvider),
              );
            }
          }
        })(),
      ),
      drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: ColorConstant.blueColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: ColorConstant.blueColor,
                            size: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CustomTextColor(
                            color: Colors.white, text: 'John Doe', size: 14),
                        const SizedBox(height: 5),
                        const CustomTextColor(
                            color: Colors.white,
                            text: 'johndoe@gmail.com',
                            size: 14),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('Transaksi'),
                    selected: _selectedIndex == 0,
                    onTap: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Barang'),
                    selected: _selectedIndex == 1,
                    onTap: () {
                      _onItemTapped(1);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransaksiList(TransaksiProvider transaksiProvider) {
    final listTransaksi = transaksiProvider.listTransaksi;
    return listTransaksi.isEmpty
        ? const NoData(
            textContent: ConstantText.titleNotFoundSearch,
          )
        : ListView.builder(
            itemCount: listTransaksi.length,
            itemBuilder: (context, index) {
              final transaksi = listTransaksi[index];
              return ItemTransaksi(
                id: transaksi.transactionNumber,
                timeCreated: transaksi.date,
                customerName: transaksi.namaCustomer,
                customerCode: transaksi.kodeCustomer,
                date: transaksi.date,
                noTelp: transaksi.noTelpCustomer,
                btnOnPress: () {},
              );
            },
          );
  }

  Widget _buildBarangList(BarangProvider barangProvider) {
    final listBarang = barangProvider.listBarang;
    return listBarang.isEmpty
        ? const NoData(textContent: ConstantText.titleNotFoundSearch)
        : ListView.builder(
            itemCount: listBarang.length,
            itemBuilder: (context, index) {
              final barang = listBarang[index];
              return ItemBarang(
                id: barang.id,
                namaBarang: barang.namaBarang,
                kodeBarang: barang.kodeBarang,
                nomorBarang: barang.nomorBarang.toString(),
                hargaBarang: barang.hargaBarang,
                jumlahBarang: barang.jumlahBarang,
                totalHargaBarang: barang.totalHargaBarang,
                btnOnPress: () {},
              );
            },
          );
  }
}
