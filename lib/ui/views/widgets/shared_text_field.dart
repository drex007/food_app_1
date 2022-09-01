import 'package:flutter/material.dart';
import "package:trofira/core/utils/ui_helpers.dart";

class SharedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? text) validator;
  final TextInputType keyBoardType;
  final Widget? icon;
  final String label;
  final int? maxLength;
  final bool obscureText;

  const SharedTextField({
    Key? key,
    required this.controller,
    required this.validator,
    this.icon,
    this.keyBoardType = TextInputType.text,
    required this.label,
    this.maxLength,
    this.obscureText = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      controller: controller,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: obscureText,
      validator: validator,
      maxLength: maxLength,
      decoration: textFormInputDecoration(
        label: label,
        icon: icon,
      ),
    );
  }

  static InputDecoration textFormInputDecoration(
      {required String label, Widget? icon}) {
    return InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      filled: true,
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.grey.withOpacity(.4),
        width: 1,
      )),
      labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(.4),
          width: 1,
        ),
        borderRadius: UIHelper.fourSidedRadius(10),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(.4),
        ),
        borderRadius: UIHelper.fourSidedRadius(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(.4),
        ),
        borderRadius: UIHelper.fourSidedRadius(10),
      ),
      suffixIcon: icon,
    );
  }
}
