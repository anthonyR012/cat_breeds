import 'package:catbreeds/config/constant/assets_constant.dart';
import 'package:catbreeds/config/constant/color_constant.dart';
import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/config/constant/values_constant.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget(
      {super.key,
      required this.width,
      this.textLabel = inputSearchCat,
      this.height,
      this.onTapIcon,
      this.onSubmitted,
      this.onChanged,
      this.onFocusListener,
      this.focusNode,
      required this.controller,
      this.validator});
  final double width;
  final double? height;
  final void Function()? onTapIcon;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onFocusListener;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: const BoxConstraints(
          minHeight: heightTextFieldSize * 1.3,
          maxHeight: heightTextFieldSize * 4),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        validator: validator,
        style: const TextStyle(
            color: blackColorTheme,
            fontFamily: fontFamilyHind,
            fontSize: messageSize),
        decoration: InputDecoration(
          filled: false,
          errorStyle: const TextStyle(
              fontFamily: fontFamilyMontserrat,
              fontWeight: FontWeight.bold,
              fontSize: h5Size),
          fillColor: primaryColorTheme,
          labelText: textLabel,
          suffixIconConstraints: const BoxConstraints(
            minWidth: iconInputSize,
            minHeight: iconInputSize,
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: iconInputSize,
            minHeight: iconInputSize,
          ),
          // prefixIcon: iconPrefix,
          labelStyle: const TextStyle(
              fontFamily: fontFamilyHind,
              color: blackColorTheme,
              fontSize: bodySize),
        ),
      ),
    );
  }
}
