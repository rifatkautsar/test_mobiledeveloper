import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_mobiledeveloper/data/sql_helper.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/input_transaksi.dart';
import 'package:test_mobiledeveloper/widget/success_alert.dart';

import '../data/model/transaksi_model.dart';
import '../widget/nav_drawer.dart';

class TransaksiProvider extends ChangeNotifier {
  List<TransactionModel> listTransaksi = [];

  List<TransactionModel> get getListTransaksi => listTransaksi;

  void addTransaction(TransactionModel transactionModel) {
    listTransaksi.add(transactionModel);
    notifyListeners();
  }

  void updateTransaction(TransactionModel transactionModel) async {
    await SQLHelper.update(transactionModel);
    Get.offAll(() => const NavDrawer());
    Get.snackbar('Success', 'Data berhasil diupdate');
  }

  void deleteTransaction(int id) async {
    await SQLHelper.deleteTransaksi(id);
    await loadTransaksi();
  }

  Future<void> loadTransaksi() async {
    List<TransactionModel> list = await SQLHelper.getTransaksiData();
    listTransaksi = list;
    notifyListeners();
  }

  Future<void> addDataTransaction(
      String transaksiNumber,
      String tanggalTransaksi,
      String kodeCustomer,
      String namaCustomer,
      String noTelpCustomer) async {
    TransactionModel newTransaction = TransactionModel(
      id: 0,
      transactionNumber: int.parse(transaksiNumber),
      date: tanggalTransaksi,
      kodeCustomer: kodeCustomer,
      namaCustomer: namaCustomer,
      noTelpCustomer: noTelpCustomer,
    );

    int result = await SQLHelper.insert(newTransaction);
    Get.off(() => const NavDrawer());
    showSuccessDialog(() {
      Get.off(() => const InputTransaksi());
    }, 'Data Berhasil Ditambahkan');
    print(result);
  }
/*
  Future<List<String>> getProductCodes() async {
    List<String> productCodes = await SQLHelper.getProductCode();
    return productCodes;
  }
*/
}
