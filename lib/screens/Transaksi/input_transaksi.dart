import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/components/constant_text.dart';
import 'package:test_mobiledeveloper/data/utilities/date_utils.dart';
import 'package:test_mobiledeveloper/provider/transaksi_provider.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/Item_input.dart';
import 'package:test_mobiledeveloper/widget/app_bar_custom.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class InputTransaksi extends StatefulWidget {
  const InputTransaksi({super.key});

  @override
  State<InputTransaksi> createState() => _InputTransaksiState();
}

class _InputTransaksiState extends State<InputTransaksi> {
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? date;
  String? selectedDateError;
  String alert = 'Tanggal Transaksi Tidak boleh kosong';

  TextEditingController nomorController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  bool validasi() {
    bool valid = true;
    if (!_formKey.currentState!.validate()) valid = false;
    if (date == null) {
      valid = false;
      selectedDateError = alert;
      setState(() {});
    }
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    final transaksiProvider = Provider.of<TransaksiProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: const AppBarCustom(menuName: 'Input Transaksi'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    ItemInput(
                      text: 'Nomor Transaksi',
                      textSize: 15,
                      controller: nomorController,
                      hintText: 'Masukan Nomor Transaksi',
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor Transaksi Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (tanggalController.text.isEmpty)
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextBlack(
                                    text: 'Tanggal Transaksi', size: 15),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: CustomButtonOutlined(
                                      btnColor: ColorConstant.blueColor,
                                      btnText: 'Show Date',
                                      btnOnPress: () {
                                        DateUtilsCustom.showDatePickerGlobal(
                                            context, tanggalController,
                                            (pickedDate) {
                                          setState(() {
                                            selectedDate = pickedDate;
                                            date = selectedDate.toString();
                                          });
                                        });
                                      },
                                      btnRadius: 10),
                                ),
                              ],
                            ),
                          )
                        else
                          ItemInput(
                            text: 'Tanggal',
                            textSize: 15,
                            controller: tanggalController,
                            icon: Icons.edit,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                'Tanggal Transaksi Tidak boleh kosong';
                              }
                              return null;
                            },
                            onTap: () {
                              DateUtilsCustom.showDatePickerGlobal(
                                  context, tanggalController, (pickedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                  date = selectedDate.toString();
                                });
                              });
                            },
                            readOnly: true,
                          ),
                        const SizedBox(height: 5),
                        selectedDateError == null
                            ? const SizedBox.shrink()
                            : tanggalController.text.isNotEmpty
                                ? const SizedBox.shrink()
                                : Text(
                                    alert,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ItemInput(
                        text: 'Kode Customer',
                        textSize: 15,
                        controller: kodeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kode Customer Tidak boleh kosong';
                          }
                          return null;
                        }),
                    const SizedBox(height: 10),
                    ItemInput(
                      text: 'Nama Customer',
                      textSize: 15,
                      controller: namaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Customer Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    ItemInput(
                      text: 'No Telp Customer',
                      textSize: 15,
                      controller: noTelpController,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No Telp Customer Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: CustomButtonRectangleBorder(
                          btnColor: ColorConstant.blueColor,
                          btnText: 'Simpan',
                          btnOnPress: () {
                            if (validasi()) {
                              CustomAlertDialog.showConfirmationDialog(
                                  context, ConstantText.confirmationAlert, () {
                                transaksiProvider.addDataTransaction(
                                    nomorController.text,
                                    tanggalController.text,
                                    kodeController.text,
                                    namaController.text,
                                    noTelpController.text);
                                FocusScope.of(context).unfocus();
                              });
                            }
                          },
                          btnRadius: 15),
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
