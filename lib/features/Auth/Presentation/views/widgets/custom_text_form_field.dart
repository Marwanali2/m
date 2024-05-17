import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.label,
    this.hintText,
    this.onChanged,
    this.controller,
    this.isPassword = false,
    this.keyboardType,
  }) : super(key: key);

  final String? label;
  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? isPassword;
  final TextInputType ?keyboardType;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required ${widget.label} Field*';
        }
        return null;
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        label: Text(
          "${widget.label}",
          style: const TextStyle(color: Colors.white),
        ),
        hintText: "${widget.hintText}",
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: widget.isPassword!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              )
            : null,
      ),
      onChanged: widget.onChanged,
      obscureText: widget.isPassword! && _obscureText,
    );
  }
}
