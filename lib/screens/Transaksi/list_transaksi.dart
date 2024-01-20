import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/provider/transaksi_provider.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/input_transaksi.dart';
import 'package:test_mobiledeveloper/widget/AlertDialog.dart';
import 'package:test_mobiledeveloper/widget/constant_text.dart';
import 'package:test_mobiledeveloper/screens/Transaksi/item_transaksi.dart';
import 'package:test_mobiledeveloper/widget/no_data.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPage();
}

class _TransaksiPage extends State<TransaksiPage> {
  @override
  void initState() {
    Provider.of<TransaksiProvider>(context, listen: false).loadTransaksi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => context.read<TransaksiProvider>().loadTransaksi(),
      initialData: [],
      child: Consumer<TransaksiProvider>(builder: (context, transaksiProvider, child) {
        return Scaffold(
          backgroundColor: ColorConstant.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InputTransaksi()));
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
              child: transaksiProvider.getIsLoading
                ? const Center(child: CircularProgressIndicator())
                  :  transaksiProvider.listTransaksi.isEmpty
                  ? const Center(child: NoData())
                  : ListView.separated(
                  itemCount: transaksiProvider.getListTransaksi.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final transaksi =
                    transaksiProvider.getListTransaksi[index];
                    return ItemTransaksi(
                        id: transaksi.id,
                        timeCreated: transaksi.date,
                        customerName: transaksi.namaCustomer,
                        customerCode: transaksi.kodeCustomer,
                        date: transaksi.date,
                        noTelp: transaksi.noTelpCustomer,
                        btnOnPress: () {
                          CustomAlertDialog.showConfirmationDialog(
                              context, ConstantText.konfirmasiHapus, () {
                            transaksiProvider
                                .deleteTransaction(transaksi.id);
                            Get.back();
                            Get.snackbar('Confirmation', 'Data Berhasil Dihapus');
                          });
                        });
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                          }),
            ),
          ),
        );
      }),
    );
  }
}
