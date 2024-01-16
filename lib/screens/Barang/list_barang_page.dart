import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/screens/Barang/input_barang_page.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/item_barang.dart';

class ListBarangPage extends StatelessWidget {
  const ListBarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InputBarangPage()));
          },
          shape: const CircleBorder(),
          backgroundColor: ColorConstant.blueColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomTextBlack(text: 'List Barang', size: 25),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => ItemBarang(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
