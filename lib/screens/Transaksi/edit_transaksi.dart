import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/data/utilities/date_utils.dart';
import 'package:test_mobiledeveloper/provider/transaksi_provider.dart';
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
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? date;

  late TextEditingController nomorTransaksiController =
      TextEditingController(text: widget.nomorTransaksi);
  late TextEditingController tanggalTransaksiController =
      TextEditingController(text: widget.tanggalTransaksi);
  late TextEditingController kodeCustomerController =
      TextEditingController(text: widget.kodeCustomer);
  late TextEditingController namaCustomerController =
      TextEditingController(text: widget.namaCustomer);
  late TextEditingController noTelpCustomerController =
      TextEditingController(text: widget.noTelpCustomer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const AppBarCustom(menuName: 'Edit Transaksi'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    ItemInput(
                      text: 'Nomor Transaksi',
                      textSize: 15,
                      validator: (value) {
                        if (value == null || nomorTransaksiController.text.isEmpty) {
                          return 'Nomor Transaksi Tidak boleh kosong';
                        }
                        return null;
                      },
                      controller: nomorTransaksiController,
                      readOnly: true,
                    ),
                    const SizedBox(height: 10),
                    ItemInput(
                      text: 'Tanggal',
                      textSize: 15,
                      controller: tanggalTransaksiController,
                      icon: Icons.edit,
                      /*       validator: (value) {
                        if (value == null || value.isEmpty) {
                          'Tanggal Transaksi Tidak boleh kosong';
                        }
                        return null;
                      },*/
                      onTap: () {
                        DateUtilsCustom.showDatePickerGlobal(
                            context, tanggalTransaksiController, (pickedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                            date = selectedDate.toString();
                          });
                        });
                      },
                      readOnly: true,
                    ),
                    const SizedBox(height: 10),
                    ItemInput(
                      text: 'Kode Customer',
                      textSize: 15,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kode Customer tidak boleh kosong';
                        }
                        return null;
                      },
                      controller: kodeCustomerController,
                    ),
                    const SizedBox(height: 10),
                    ItemInput(
                      text: 'Nama Customer',
                      textSize: 15,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Customer tidak boleh kosong';
                        }
                        return null;
                      },
                      controller: namaCustomerController,
                    ),
                    const SizedBox(height: 10),
                    ItemInput(
                      text: 'No Telp Customer',
                      textSize: 15,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No Telp Customer tidak boleh kosong';
                        }
                        return null;
                      },
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
                            if (_formKey.currentState!.validate()) {
                              TransactionModel transactionModel =
                                  TransactionModel(
                                      id: widget.id,
                                      transactionNumber: int.parse(
                                          nomorTransaksiController.text),
                                      date: tanggalTransaksiController.text,
                                      kodeCustomer: kodeCustomerController.text,
                                      namaCustomer: namaCustomerController.text,
                                      noTelpCustomer:
                                          noTelpCustomerController.text);
                              Provider.of<TransaksiProvider>(context,
                                      listen: false)
                                  .updateTransaction(transactionModel);
                              FocusScope.of(context).unfocus();
                            }
                          },
                          btnRadius: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
