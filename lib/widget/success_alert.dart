import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_mobiledeveloper/components/color.dart';
import 'package:test_mobiledeveloper/widget/custom_button.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';
import 'package:test_mobiledeveloper/widget/nav_drawer.dart';

Future showSuccessDialog(Function onPress, String textContent) {
  return Get.dialog(
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: Get.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/success_animation.json',
                    width: Get.width * 0.4, height: Get.height * 0.3),
                const SizedBox(height: 20),
                 CustomTextBlack(
                    text: textContent,
                    size: 15,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonOutlined(
                      btnColor: ColorConstant.blueColor,
                      btnText: 'Tutup',
                      btnOnPress: () {
                        Get.back();
                      },
                      btnRadius: 5),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonRectangleBorder(
                      btnColor: ColorConstant.blueColor,
                      btnText: 'Tambah Lagi',
                      btnOnPress: () {
                        onPress();
                      },
                      btnRadius: 5),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class SuccessAlert extends StatelessWidget {
  const SuccessAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*SvgPicture.asset(
              'assets/success_icon.svg',
              width: Get.width * 0.3,
              height: Get.height * 0.3,
            ),*/
            Lottie.asset('assets/success_animation.json',
                width: Get.width * 0.6, height: Get.height * 0.3),
            const SizedBox(height: 20),
            const CustomTextBlack(
                text: 'Success', size: 15, fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            const CustomTextColor(
                color: Colors.grey,
                text: 'Data berhasil di tambahkan',
                size: 15),
            const SizedBox(height: 10),
            CustomButtonOutlined(
                btnColor: ColorConstant.blueColor,
                btnText: 'Kembali Ke Halaman Utama',
                btnOnPress: () {
                  Get.offAll(() => const NavDrawer());
                },
                btnRadius: 5)
          ],
        ),
      ),
    );
  }
}
