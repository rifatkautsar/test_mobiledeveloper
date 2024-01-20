import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/provider/barang_provider.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/app_bar_custom.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/custom_text_field.dart';

import '../../data/utilities/calculate.dart';

class InputBarangPage extends StatefulWidget {
  const InputBarangPage({super.key});

  @override
  State<InputBarangPage> createState() => _InputBarangPageState();
}

class _InputBarangPageState extends State<InputBarangPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController namaBarangController = TextEditingController();
  TextEditingController kodeBarangController = TextEditingController();
  TextEditingController nomorBarangController = TextEditingController();
  TextEditingController hargaBarangController = TextEditingController();
  TextEditingController jumlahBarangController = TextEditingController();
  TextEditingController totalBarangController =
      TextEditingController(text: '0');

  void updateTotal() {
    int harga = int.parse(hargaBarangController.text);
    int jumlah = int.parse(jumlahBarangController.text);
    int total = CalculateBarang.calculateTotal(harga, jumlah);
    totalBarangController.text = total.toString();
  }

  @override
  Widget build(BuildContext context) {
    final barangProvider = Provider.of<BarangProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const AppBarCustom(menuName: 'Input Barang'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        /*  CustomTextBlack(text: 'Barang', size: 24, fontWeight: FontWeight.bold),
                        SizedBox(height: 30),*/
                        ItemInput(
                          text: 'Nama Barang',
                          textSize: 15,
                          hintText: 'Masukan Nama Barang',
                          controller: namaBarangController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Barang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        ItemInput(
                            text: 'Kode Barang',
                            textSize: 15,
                            hintText: 'Masukan Kode Barang',
                            controller: kodeBarangController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kode Barang tidak boleh kosong';
                              }
                              return null;
                            }),
                        const SizedBox(height: 10),
                        ItemInput(
                            text: 'Nomor Barang',
                            textSize: 15,
                            hintText: 'Masukan Nomor Barang',
                            textInputType: TextInputType.number,
                            controller: nomorBarangController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nomor Barang tidak boleh kosong';
                              }
                              return null;
                            }),
                        const SizedBox(height: 10),
                        ItemInput(
                            text: 'Harga',
                            textSize: 15,
                            hintText: 'Masukan Harga Barang',
                            textInputType: TextInputType.number,
                            controller: hargaBarangController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Harga Barang tidak boleh kosong';
                              } else if (int.parse(value) <= 1) {
                                return 'Harga Barang tidak boleh 0';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              updateTotal();
                            }),
                        const SizedBox(height: 10),
                        ItemInput(
                            text: 'Jumlah',
                            textSize: 15,
                            hintText: 'Masukan Jumlah Barang',
                            controller: jumlahBarangController,
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Jumlah Barang tidak boleh kosong';
                              } else if (int.parse(value) <= 1) {
                                return 'Jumlah Barang tidak boleh 0';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              updateTotal();
                            }),
                        const SizedBox(height: 10),
                        ItemInput(
                          text: 'Total',
                          textSize: 15,
                          textInputType: TextInputType.number,
                          controller: totalBarangController,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Total Barang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: CustomButtonRectangleBorder(
                              btnColor: ColorConstant.blueColor,
                              btnText: 'Simpan',
                              btnOnPress: () {
                                if (_formKey.currentState!.validate()) {
                                  barangProvider.addDataBarang(
                                      namaBarangController.text,
                                      kodeBarangController.text,
                                      int.parse(nomorBarangController.text),
                                      hargaBarangController.text,
                                      jumlahBarangController.text,
                                      totalBarangController.text);
                                }
                                FocusScope.of(context).unfocus();
                              },
                              btnRadius: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
