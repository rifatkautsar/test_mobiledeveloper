import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/app_bar_custom.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';

import '../../data/model/barang_model.dart';
import '../../provider/barang_provider.dart';

class EditBarang extends StatefulWidget {
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
  State<EditBarang> createState() => _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController kodeBarangController = TextEditingController(text: widget.kodeBarang);
  late TextEditingController namaBarangController = TextEditingController(text: widget.namaBarang);
  late TextEditingController nomorBarangController = TextEditingController(text: widget.nomorBarang.toString());
  late TextEditingController hargaBarangController = TextEditingController(text: widget.hargaBarang.toString());
  late TextEditingController jumlahBarangController = TextEditingController(text: widget.jumlahBarang.toString());
  late TextEditingController totalBarangController = TextEditingController(text: widget.totalBarang.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const AppBarCustom(menuName: 'Edit Barang'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // CustomTextBlack(text: 'Edit Barang', size: 24, fontWeight: FontWeight.bold),
                    ItemInput(
                      text: 'Kode Barang',
                      textSize: 15,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kode Barang tidak boleh kosong';
                        }
                        return null;
                      },
                      controller: kodeBarangController,
                    ),
                    ItemInput(
                        text: 'Nama Barang',
                        textSize: 15,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Barang tidak boleh kosong';
                          }
                          return null;
                        },
                        controller: namaBarangController),
                    const SizedBox(height: 10),
                    ItemInput(
                      text: 'Nomor Barang',
                      textSize: 15,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor Barang tidak boleh kosong';
                        }
                        return null;
                      },
                      controller: nomorBarangController,
                    ),
                    const SizedBox(height: 10),
                    ItemInput(
                        text: 'Harga',
                        textSize: 15,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harga Barang tidak boleh kosong';
                          } else if (int.parse(value) <= 1) {
                            return 'Harga Barang tidak boleh 0';
                          }
                          return null;
                        },
                        controller: hargaBarangController),
                    const SizedBox(height: 10),
                    ItemInput(
                        text: 'Jumlah',
                        textSize: 15,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Jumlah Barang tidak boleh kosong';
                          } else if (int.parse(value) <= 1) {
                            return 'Jumlah Barang tidak boleh 0';
                          }
                          return null;
                        },
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
                           if(_formKey.currentState!.validate()){
                             CustomAlertDialog.showConfirmationDialog(context,
                                 'Apakah Data Yang anda ubah sudah benar?', () {
                                   BarangModel updatedBarang = BarangModel(
                                       id: widget.id,
                                       kodeBarang: kodeBarangController.text,
                                       namaBarang: namaBarangController.text,
                                       nomorBarang: int.parse(nomorBarangController.text),
                                       hargaBarang: hargaBarangController.text,
                                       jumlahBarang: jumlahBarangController.text,
                                       totalHargaBarang: totalBarangController.text);
                                   Provider.of<BarangProvider>(context, listen: false).updateBarang(updatedBarang);
                                   FocusScope.of(context).unfocus();
                                 });
                           }
                          },
                          btnRadius: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

