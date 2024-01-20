import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/edit_transaksi.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/constant_text.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class ItemTransaksi extends StatelessWidget {
  final int id;
  final String timeCreated;
  final String customerName;
  final String customerCode;
  final String date;
  final String noTelp;
  final Function btnOnPress;

  const ItemTransaksi(
      {super.key,
      required this.id,
      required this.timeCreated,
      required this.customerName,
      required this.customerCode,
      required this.date,
      required this.noTelp,
      required this.btnOnPress});

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
          CustomTextColor(
              color: ColorConstant.blueColor,
              text: '$timeCreated-$id',
              size: 24,
              fontWeight: FontWeight.bold),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextColor(
                      color: Colors.grey, text: 'Nama Customer', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: customerName, size: 15),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextColor(
                      color: Colors.grey, text: 'Kode Customer', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: customerCode, size: 15)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextColor(
                      color: Colors.grey, text: 'Tanggal', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: date, size: 15),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextColor(
                      color: Colors.grey, text: 'NoTelp', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: noTelp, size: 15)
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
                        builder: (context) => EditTransaksi(
                          id: id,
                          nomorTransaksi: id.toString(),
                          tanggalTransaksi: timeCreated,
                          kodeCustomer: customerCode,
                          namaCustomer: customerName,
                          noTelpCustomer: noTelp,
                        ),
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
                    btnOnPress();
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
