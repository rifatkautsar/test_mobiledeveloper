import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/provider/barang_provider.dart';
import 'package:test_mobiledeveloper/screens/Barang/input_barang_page.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/constant_text.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/screens/Barang/item_barang.dart';
import 'package:test_mobiledeveloper/widget/no_data.dart';

class ListBarangPage extends StatefulWidget {
  const ListBarangPage({super.key});

  @override
  State<ListBarangPage> createState() => _ListBarangPageState();
}

class _ListBarangPageState extends State<ListBarangPage> {
  @override
  void initState() {
    Provider.of<BarangProvider>(context, listen: false).loadBarang();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BarangProvider>(builder: (context, barangProvider, child) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InputBarangPage()));
            },
            shape: const CircleBorder(),
            backgroundColor: ColorConstant.blueColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: barangProvider.listBarang.isEmpty
                  ? const Center(
                      child: NoData(),
                    )
                  : ListView.separated(
                      itemCount: barangProvider.getListBarang.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ItemBarang(
                          id: barangProvider.listBarang[index].id,
                          namaBarang:
                              barangProvider.listBarang[index].namaBarang,
                          kodeBarang:
                              barangProvider.listBarang[index].kodeBarang,
                          nomorBarang: barangProvider
                              .listBarang[index].nomorBarang
                              .toString(),
                          hargaBarang:
                              barangProvider.listBarang[index].hargaBarang,
                          jumlahBarang:
                              barangProvider.listBarang[index].jumlahBarang,
                          totalHargaBarang:
                              barangProvider.listBarang[index].totalHargaBarang,
                          btnOnPress: () {
                            CustomAlertDialog.showConfirmationDialog(
                                context, ConstantText.konfirmasiHapus, () {
                              barangProvider.deleteBarang(
                                  barangProvider.listBarang[index].id);
                              Get.back();
                              Get.snackbar(
                                  'Confirmation', 'Data berhasil dihapus');
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                    ),
            ),
          ));
    });
  }
}
