import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final controller;
  final String hintTxt;
  final bool obscureText;
  myTextField(this.controller, this.hintTxt, this.obscureText);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,

          // initialValue: 'Complete the story from here...',
          decoration: InputDecoration(
            labelText: hintTxt,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.grey.shade200,
            filled: true,
            //: controller.text,

            //hintStyle: TextStyle(color: Colors.grey[500])
          ),
        ),
      ),
    );
  }
}

class TxtField extends StatelessWidget {
  final controller;
  final String hintTxt;
  final bool obscureText;
  TxtField(this.controller, this.hintTxt, this.obscureText);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        // initialValue: controller.text,
        decoration: InputDecoration(
          labelText: hintTxt,
          //label:hintTxt,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey), gapPadding: 50.0),
          fillColor: Colors.grey.shade200,
          filled: true,
          //: controller.text,

          //hintStyle: TextStyle(color: Colors.grey[500])
        ),
      ),
    );
  }
}
