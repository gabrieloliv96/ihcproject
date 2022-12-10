// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormLoginWidget extends StatefulWidget {
  final String label;
  final bool? isObscure;
  final bool? readOnly;
  final Icon icon;
  final TextInputType textInput;
  final Color cor;
  final bool? showButtom;
  final TextEditingController? controller;
  final Function(String)? onChangeController;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String? hint;

  const TextFormLoginWidget({
    Key? key,
    required this.label,
    this.readOnly,
    this.isObscure,
    required this.icon,
    required this.textInput,
    required this.cor,
    this.showButtom,
    this.controller,
    this.onChangeController,
    this.onTap,
    this.inputFormatters,
    this.validator,
    this.hint,
  }) : super(key: key);

  @override
  State<TextFormLoginWidget> createState() => _TextFormLoginWidgetState();
}

class _TextFormLoginWidgetState extends State<TextFormLoginWidget> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      readOnly: (widget.readOnly == null || false) ? false : true,
      controller: widget.controller,
      style: TextStyle(
        color: widget.cor,
      ),
      cursorColor: widget.cor,
      keyboardType: widget.textInput,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.blue.shade900.withOpacity(0.5)),
        hoverColor: widget.cor,
        labelText: widget.label,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 16),
        labelStyle: TextStyle(color: widget.cor, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: widget.cor),
        ),
        contentPadding: const EdgeInsets.all(15),
        prefixIcon: widget.icon,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(color: widget.cor),
        ),
        suffixIcon: (widget.showButtom == null)
            ? null
            : IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.blue.shade900,
                ),
                onPressed: _toggle,
              ),
      ),
      obscureText: (widget.isObscure == null) ? false : _obscureText,
      onChanged: widget.onChangeController,
      onTap: widget.onTap,
    );
  }
}
