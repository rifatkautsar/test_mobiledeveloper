import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/provider/transaksi_provider.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/app_bar_custom.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';

import '../../data/model/transaksi_model.dart';

class EditTransaksi extends StatefulWidget {
  final int id;
  final String nomorTransaksi;
  final String tanggalTransaksi;
  final String kodeCustomer;
  final String namaCustomer;
  final String noTelpCustomer;

  const EditTransaksi(
      {super.key,
      required this.id,
      required this.nomorTransaksi,
      required this.tanggalTransaksi,
      required this.kodeCustomer,
      required this.namaCustomer,
      required this.noTelpCustomer});

  @override
  State<EditTransaksi> createState() => _EditTransaksiState();
}

class _EditTransaksiState extends State<EditTransaksi> {

  late TextEditingController nomorTransaksiController = TextEditingController(text: widget.nomorTransaksi);
  late TextEditingController tanggalTransaksiController = TextEditingController(text: widget.tanggalTransaksi);
  late TextEditingController kodeCustomerController = TextEditingController(text: widget.kodeCustomer);
  late TextEditingController namaCustomerController = TextEditingController(text: widget.namaCustomer);
  late TextEditingController noTelpCustomerController = TextEditingController(text: widget.noTelpCustomer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const AppBarCustom(menuName: 'Edit Transaksi'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  ItemInput(
                    text: 'Nomor Transaksi',
                    textSize: 15,
                    controller: nomorTransaksiController,
                    readOnly: true,
                  ),
                  const SizedBox(height: 10),
                  ItemInput(
                    text: 'Tanggal Transaski',
                    textSize: 15,
                    readOnly: true,
                    controller: tanggalTransaksiController,
                  ),
                  const SizedBox(height: 10),
                  ItemInput(
                    text: 'Kode Customer',
                    textSize: 15,
                    controller: kodeCustomerController,
                  ),
                  const SizedBox(height: 10),
                  ItemInput(
                    text: 'Nama Customer',
                    textSize: 15,
                    controller: namaCustomerController,
                  ),
                  const SizedBox(height: 10),
                  ItemInput(
                    text: 'No Telp Customer',
                    textSize: 15,
                    textInputType: TextInputType.number,
                    controller: noTelpCustomerController,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: CustomButtonRectangleBorder(
                        btnColor: ColorConstant.blueColor,
                        btnText: 'Simpan',
                        btnOnPress: () {
                         CustomAlertDialog.showConfirmationDialog(context, 'Apakah Data yang anda ubah sudah benar?', () {
                           TransactionModel transactionModel = TransactionModel(
                               id: widget.id,
                               transactionNumber:
                               int.parse(nomorTransaksiController.text),
                               date: tanggalTransaksiController.text,
                               kodeCustomer: kodeCustomerController.text,
                               namaCustomer: namaCustomerController.text,
                               noTelpCustomer: noTelpCustomerController.text);
                           Provider.of<TransaksiProvider>(context, listen: false).updateTransaction(transactionModel);
                         });
                        },
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
