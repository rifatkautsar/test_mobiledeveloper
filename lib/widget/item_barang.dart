import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/Barang/edit_barang.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class ItemBarang extends StatelessWidget {
  const ItemBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextColor(
              color: ColorConstant.blueColor,
              text: '01',
              size: 24,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextColor(
                      color: Colors.grey, text: 'Nama barang', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: 'Barang A', size: 15),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextColor(
                      color: Colors.grey, text: 'Jumlah Barang', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: '1', size: 15)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextColor(
                      color: Colors.grey, text: 'Kode Barang', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: 'A001', size: 15),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextColor(
                      color: Colors.grey, text: 'Total', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: '595.000.000', size: 15)
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
            thickness: 0.2,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButtonRectangleBorder(
                  btnColor: ColorConstant.blueColor,
                  btnText: 'Edit',
                  btnRadius: 10,
                  btnOnPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditBarang(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CustomButtonOutlined(
                  btnColor: ColorConstant.blueColor,
                  btnText: 'Hapus',
                  btnRadius: 10.0,
                  btnOnPress: () {
                    CustomAlertDialog.showConfirmationDialog(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
