import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/app_bar_custom.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/custom_text_field.dart';

class InputTransaksi extends StatelessWidget {
  const InputTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const AppBarCustom(menuName: 'Input Transaksi'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  CustomTextBlack(
                      text: 'Transaksi', size: 24, fontWeight: FontWeight.bold),
                  ItemInput(text: 'Nomor', textSize: 15),
                  SizedBox(height: 10),
                  ItemInput(text: 'Tanggal', textSize: 15),
                  SizedBox(height: 30),
                  CustomTextBlack(
                      text: 'Customer', size: 24, fontWeight: FontWeight.bold),
                  SizedBox(height: 10),
                  ItemInput(text: 'Kode', textSize: 15),
                  SizedBox(height: 10),
                  ItemInput(text: 'Nama', textSize: 15),
                  SizedBox(height: 10),
                  ItemInput(text: 'No Telp', textSize: 15),
                  SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: CustomButtonRectangleBorder(
                        btnColor: ColorConstant.blueColor,
                        btnText: 'Simpan',
                        btnOnPress: () {},
                        btnRadius: 15),
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
