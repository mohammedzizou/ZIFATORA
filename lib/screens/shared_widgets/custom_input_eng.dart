// ignore_for_file: camel_case_types

import 'package:fatura_app/constants/colors.dart';
import 'package:fatura_app/env/dimensions.dart';
import 'package:fatura_app/screens/shared_widgets/custom_richText.dart';
import 'package:flutter/material.dart';

class CustomInput_eng extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String label;
  final bool isRequired;
  final double? height;
  final double? width;
 
  const CustomInput_eng({
    required this.label,
    required this.controller,
    this.type,
    this.height,
    this.width,
    this.isRequired = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.calcH(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomRichText(
            text: label,
            children: (isRequired)
                ? [
                    const TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ]
                : [],
          ),
          SizedBox(
            height: Dimensions.calcH(8),
          ),
          Container(
            
            color: AppColors.kSecondaryColor,
            height: height,
            width: width,
           /* margin: EdgeInsets.only(
              right: Dimensions.calcW(50),
            ),*/
            child: Center(
              child: TextFormField(
                controller: controller,
                keyboardType: type,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: AppColors.kSecondaryColor,
                  filled: true,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
