import 'package:flutter/material.dart';

class DefaultTextForm extends StatelessWidget {
  const DefaultTextForm({Key? key, required this.controller, this.focusNode,
    required this.labelText, this.type,this.onTap,this.haveIconImage = false,
    this.validate, this.maxLength, this.onSubmit, this.isDate = false,
    this.iconColor = Colors.white,this.suffix,this.iconImage,this.readOnly = false}) : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String labelText;
  final TextInputType? type;
  final FormFieldValidator<String>? validate;
  final int? maxLength;
  final ValueChanged<String>? onSubmit;
  final GestureTapCallback? onTap;
  final bool isDate;
  final IconData? suffix;
  final bool haveIconImage;
  final ImageIcon? iconImage;
  final Color iconColor;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      //textDirection: TextDirection.rtl,
      //textAlign: TextAlign.right,
      maxLength: maxLength,
      keyboardType: type,
      focusNode: focusNode,
      validator: validate,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: const TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.only(right: screenWidth * 0.04,
            top: screenHeight * 0.02,bottom: screenHeight * 0.02),
        suffixIcon: haveIconImage ? iconImage : Icon(suffix,color: iconColor),

      ),
    );
  }
}
