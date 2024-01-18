import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/list_transaksi.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/success_alert.dart';

import '../screens/Barang/list_barang_page.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  int _selectedIndex = 0;
  String? _title;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ListBarangPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _title = _selectedIndex == 0 ? 'Transaksi' : 'Barang';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.blueColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: CustomTextColor(
            color: Colors.white, text: _title.toString(), size: 20),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
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
                      color: Colors.white, text: 'johndoe@gmail.com', size: 14),
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
      ),
    );
  }
}
