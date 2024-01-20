import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/Barang/edit_barang.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class ItemBarang extends StatelessWidget {
  final int id;
  final String namaBarang;
  final String kodeBarang;
  final String nomorBarang;
  final String hargaBarang;
  final String jumlahBarang;
  final String totalHargaBarang;
  final Function btnOnPress;

  const ItemBarang(
      {super.key,
      required this.id,
      required this.namaBarang,
      required this.kodeBarang,
      required this.nomorBarang,
      required this.hargaBarang,
      required this.jumlahBarang,
      required this.totalHargaBarang,
      required this.btnOnPress});

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
          CustomTextColor(
              color: ColorConstant.blueColor,
              text: id.toString(),
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
                      color: Colors.grey, text: 'Nama barang', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: namaBarang, size: 15),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextColor(
                      color: Colors.grey, text: 'Jumlah Barang', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: jumlahBarang, size: 15)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextColor(
                      color: Colors.grey, text: 'Kode Barang', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: kodeBarang, size: 15),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextColor(
                      color: Colors.grey, text: 'Total', size: 16),
                  const SizedBox(height: 5),
                  CustomTextBlack(text: hargaBarang, size: 15)
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
                        builder: (context) => EditBarang(
                            id: id,
                            kodeBarang: kodeBarang,
                            namaBarang: namaBarang,
                            nomorBarang: int.parse(nomorBarang),
                            hargaBarang: int.parse(hargaBarang),
                            jumlahBarang: int.parse(jumlahBarang),
                            totalBarang: int.parse(totalHargaBarang)),
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
