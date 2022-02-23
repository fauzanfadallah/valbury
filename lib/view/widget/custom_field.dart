import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  String title;
  Color titleColor;
  String? Function(String?) validator;
  String hintText;
  bool enabled;
  TextInputType keyboardType;
  TextEditingController? controller;
  String? initialValue;

  CustomField(
      {Key? key,
      required this.title,
      this.titleColor = Colors.white,
      required this.validator,
      this.hintText = '',
      this.keyboardType = TextInputType.text,
      this.enabled = true,
      this.controller,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: titleColor, fontSize: 16, fontWeight: FontWeight.w500),
            )),
        TextFormField(
          validator: validator,
          keyboardType: keyboardType,
          controller: controller,
          enabled: enabled,
          initialValue: initialValue,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ],
    );
  }
}
