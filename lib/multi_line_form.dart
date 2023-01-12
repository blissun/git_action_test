
import 'package:flutter/material.dart';

class MultiLineField extends StatefulWidget {
  MultiLineField({
    Key? key,
    required this.validator,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.abled,
    this.onSaved,
    this.onChanged,
    this.label,
  }) : super(key: key);
  FormFieldValidator validator;
  TextEditingController controller;
  FocusNode focusNode;
  String hintText;
  bool abled;
  void Function(String?)? onSaved;
  void Function(String)? onChanged;
  String? label;

  @override
  State<MultiLineField> createState() => _MultiLineFieldState();
}

class _MultiLineFieldState extends State<MultiLineField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: Container(
        child: TextFormField(
          autofocus: true,
          controller: widget.controller,
          focusNode: widget.focusNode,
          maxLength: 100,
          minLines: 4,
          maxLines: 4,
          keyboardType: TextInputType.multiline,
          cursorColor: Colors.black,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          autovalidateMode: AutovalidateMode.always,
          style: TextStyle(
            color: const Color(0xff111111),
            fontSize: 13,
            height: 1.5,
          ),
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(
              vertical: 13,
              horizontal: 15,
            ),
            border: basicBorderStyle(),
            focusedBorder: focusedBorderStyle(),
            enabledBorder: enabledBorderStyle(),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder disabledBorderStyle() {
  return OutlineInputBorder(
    gapPadding: 0.0,
    borderRadius: const BorderRadius.all(
      Radius.circular(2.0),
    ),
    borderSide: BorderSide(
      width: 0.5,
      color: Colors.lightGreen,
    ),
  );
}

OutlineInputBorder enabledBorderStyle() {
  return OutlineInputBorder(
    gapPadding: 0.0,
    borderRadius: const BorderRadius.all(
      Radius.circular(2.0),
    ),
    borderSide: BorderSide(
      width: 0.5,
      color: Colors.lightBlue,
    ),
  );
}

OutlineInputBorder basicBorderStyle() {
  return OutlineInputBorder(
    gapPadding: 0.0,
    borderRadius: const BorderRadius.all(
      Radius.circular(2.0),
    ),
    borderSide: BorderSide(
      color: Colors.lightGreen,
      width: 0.5,
    ),
  );
}

OutlineInputBorder focusedBorderStyle({helperText}) {
  return OutlineInputBorder(
    gapPadding: 0.0,
    borderRadius: const BorderRadius.all(
      Radius.circular(2.0),
    ),
    borderSide: BorderSide(
      width: 0.5,
      color: Colors.lightBlueAccent,
    ),
  );
}
