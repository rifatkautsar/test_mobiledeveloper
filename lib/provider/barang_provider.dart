import 'dart:async';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:test_mobiledeveloper/data/model/barang_model.dart';
import 'package:test_mobiledeveloper/screens/Barang/input_barang_page.dart';
import 'package:test_mobiledeveloper/widget/nav_drawer.dart';
import 'package:test_mobiledeveloper/widget/success_alert.dart';

import '../data/sql_helper.dart';

class BarangProvider extends ChangeNotifier {
  List<BarangModel> listBarang = [];

  List<BarangModel> get getListBarang => listBarang;

  void addBarang(BarangModel barangModel) {
    listBarang.add(barangModel);
    notifyListeners();
  }

  Future<void> updateBarang(BarangModel barangModel) async {
    await SQLHelper.updateBarang(barangModel);
    Get.to(() => const NavDrawer());
    Get.snackbar('Success', 'Data berhasil diupdate');
  }

  void deleteBarang(int id) async {
    await SQLHelper.deleteBarang(id);
    await loadBarang();
  }

  Future<void> loadBarang() async {
    List<BarangModel> list = await SQLHelper.getBarangData();
    listBarang = list;
    notifyListeners();
  }

  Future<void> addDataBarang(
      String namaBarang,
      String kodeBarang,
      int nomorBarang,
      String hargaBarang,
      String jumlahBarang,
      String totalBarang) async {
    BarangModel newBarang = BarangModel(
        id: 0,
        namaBarang: namaBarang,
        kodeBarang: kodeBarang,
        nomorBarang: int.parse(nomorBarang.toString()),
        hargaBarang: hargaBarang,
        jumlahBarang: jumlahBarang,
        totalHargaBarang: totalBarang);

    int result = await SQLHelper.insertBarang(newBarang);
    Get.off(() => const NavDrawer());
    showSuccessDialog(() {
      Get.off(() => const InputBarangPage());
    }, 'Data Berhasil Ditambahkan');
    print(result);


  }

  Future<List<String>> getProductCodes() async {
    List<String> productCodes = await SQLHelper.getProductCode();
    print(productCodes);
    return productCodes;
  }
}
