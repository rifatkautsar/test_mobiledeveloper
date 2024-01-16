import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/app_bar_custom.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class EditBarang extends StatelessWidget {
  const EditBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
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
                  ItemInput(text: 'Kode Barang', textSize: 15),
                  SizedBox(height: 10),
                  ItemInput(text: 'Nomor Barang', textSize: 15),
                  SizedBox(height: 10),
                  ItemInput(text: 'Harga', textSize: 15),
                  SizedBox(height: 10),
                  ItemInput(text: 'Jumlah', textSize: 15),
                  SizedBox(height: 10),
                  ItemInput(text: 'Total', textSize: 15),
                  SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: CustomButtonRectangleBorder(
                        btnColor: ColorConstant.blueColor,
                        btnText: 'Simpan',
                        btnOnPress: () {},
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
