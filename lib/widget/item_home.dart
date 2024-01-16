import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/edit_transaksi.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class ItemHome extends StatelessWidget {
  const ItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextColor(
              color: ColorConstant.blueColor,
              text: '202101-0001',
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
                      color: Colors.grey, text: 'Nama Customer', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: 'Johnny', size: 15),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextColor(
                      color: Colors.grey, text: 'Jumlah Barang', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: '2', size: 15)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextColor(
                      color: Colors.grey, text: 'Tanggal', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: 'Johnny', size: 15),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextColor(
                      color: Colors.grey, text: 'Total Harga', size: 16),
                  SizedBox(height: 5),
                  CustomTextBlack(text: '245.000.000', size: 15)
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
                        builder: (context) => const EditTransaksi(),
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
