import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/Barang/input_barang_page.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/input_transaksi.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/item_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const InputTransaksi()));
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
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const ItemHome();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              }),
        ),
      ),
    );
  }
}
