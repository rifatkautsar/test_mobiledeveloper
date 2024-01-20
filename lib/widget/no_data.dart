import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_mobiledeveloper/widget/custom_text.dart';

class NoData extends StatelessWidget {

  final String? textContent;
  const NoData({super.key, this.textContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/no_data.svg',
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        const SizedBox(height: 20),
         CustomTextBlack(
            text: textContent ?? 'Belum Ada Data',
            size: 15,
            fontWeight: FontWeight.bold),
      ],
    );
  }
}
