import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/app_bar_custom.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

import '../../data/model/barang_model.dart';
import '../../provider/barang_provider.dart';

class EditBarang extends StatelessWidget {
  final int id;
  final String kodeBarang;
  final String namaBarang;
  final int nomorBarang;
  final int hargaBarang;
  final int jumlahBarang;
  final int totalBarang;

  const EditBarang(
      {super.key,
      required this.id,
      required this.kodeBarang,
      required this.namaBarang,
      required this.nomorBarang,
      required this.hargaBarang,
      required this.jumlahBarang,
      required this.totalBarang});

  @override
  Widget build(BuildContext context) {
    TextEditingController kodeBarangController =
        TextEditingController(text: kodeBarang);
    TextEditingController namaBarangController =
        TextEditingController(text: namaBarang);
    TextEditingController nomorBarangController =
        TextEditingController(text: nomorBarang.toString());
    TextEditingController hargaBarangController =
        TextEditingController(text: hargaBarang.toString());
    TextEditingController jumlahBarangController =
        TextEditingController(text: jumlahBarang.toString());
    TextEditingController totalBarangController =
        TextEditingController(text: totalBarang.toString());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const AppBarCustom(menuName: 'Edit Barang'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // CustomTextBlack(text: 'Edit Barang', size: 24, fontWeight: FontWeight.bold),
                  ItemInput(
                    text: 'Kode Barang',
                    textSize: 15,
                    controller: kodeBarangController,
                  ),
                  ItemInput(
                      text: 'Nama Barang',
                      textSize: 15,
                      controller: namaBarangController),
                  const SizedBox(height: 10),
                  ItemInput(
                    text: 'Nomor Barang',
                    textSize: 15,
                    controller: nomorBarangController,
                  ),
                  const SizedBox(height: 10),
                  ItemInput(
                      text: 'Harga',
                      textSize: 15,
                      controller: hargaBarangController),
                  const SizedBox(height: 10),
                  ItemInput(
                      text: 'Jumlah',
                      textSize: 15,
                      controller: jumlahBarangController),
                  const SizedBox(height: 10),
                  ItemInput(
                      text: 'Total',
                      textSize: 15,
                      controller: totalBarangController),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: CustomButtonRectangleBorder(
                        btnColor: ColorConstant.blueColor,
                        btnText: 'Simpan',
                        btnOnPress: () {
                          CustomAlertDialog.showConfirmationDialog(context,
                              'Apakah Data Yang anda ubah sudah benar?', () {
                            BarangModel updatedBarang = BarangModel(
                                id: id,
                                kodeBarang: kodeBarangController.text,
                                namaBarang: namaBarangController.text,
                                nomorBarang: int.parse(nomorBarangController.text),
                                hargaBarang: hargaBarangController.text,
                                jumlahBarang: jumlahBarangController.text,
                                totalHargaBarang: totalBarangController.text);
                            Provider.of<BarangProvider>(context, listen: false)
                                .updateBarang(updatedBarang);
                          });
                        },
                        btnRadius: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
