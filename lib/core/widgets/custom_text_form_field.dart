import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.maxLines = 1,
    this.cursorColor,
    this.errorBorderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.widthEnabledBorder,
    this.widthFocusedBorder,
    this.widthErrorBorder,
    this.widthFocusedErrorBorder,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.hintColor,
    this.keyboardType, this.prefixIcon,
  });

  final String? hintText;
  final String? labelText;
  final int maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String? data)? onSubmitted;
  final TextEditingController? controller;
  final void Function(String data)? onChanged;
  final Color? cursorColor;

  final Color? errorBorderColor;
  final Color? hintColor;

  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final double? widthEnabledBorder;

  final double? widthFocusedBorder;

  final double? widthErrorBorder;
  final TextInputType? keyboardType;
  final double? widthFocusedErrorBorder;
  final void Function(String? data)? onSaved;
  final String? Function(String? data)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  TextDirection _textDirection = TextDirection.ltr;

  bool _isArabic(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    return arabicRegex.hasMatch(text);
  }

  void _handleChange(String text) {
    final isArabic = _isArabic(text);
    if ((isArabic && _textDirection != TextDirection.rtl) ||
        (!isArabic && _textDirection != TextDirection.ltr)) {
      setState(() {
        _textDirection = isArabic ? TextDirection.rtl : TextDirection.ltr;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      onChanged: _handleChange,
      onFieldSubmitted: widget.onSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      //     (data) {
      //   if (data?.isEmpty ?? true) {
      //     //data == null || data.isEmpty
      //     return 'Field is required';
      //   } else {
      //     return null;
      //   }
      // },
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      maxLines: widget.maxLines,
      cursorColor: widget.cursorColor,
      textDirection: _textDirection,
      decoration: InputDecoration(
        filled: true ,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // labelText: widget.labelText ?? 'Search',
        prefixIcon: widget.prefixIcon ??
            Icon(
              Icons.search,
              color: Colors.black,
              size: 28,
            ),
        // suffixIcon: widget.suffixIcon ??
        //     Icon(
        //       Icons.search,
        //       color: Colors.black,
        //       size: 28,
        //     ),
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 12,
          minHeight: 12,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor ?? Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        errorStyle: const TextStyle(
          color: Color(0xFFEF9A9A),
        ),
        enabledBorder: buildOutlineInputBorder(
          colorBorder: widget.enabledBorderColor ?? Colors.black,
          widthBorder: widget.widthEnabledBorder ?? 1.5,
        ),
        focusedBorder: buildOutlineInputBorder(
          colorBorder: widget.focusedBorderColor ?? Colors.black,
          widthBorder: widget.widthFocusedBorder ?? 2.5,
        ),
        errorBorder: buildOutlineInputBorder(
          colorBorder: widget.errorBorderColor ?? const Color(0xFFE57373),
          widthBorder: widget.widthErrorBorder ?? 1.5,
        ),
        focusedErrorBorder: buildOutlineInputBorder(
          colorBorder: const Color(0xFFEF9A9A),
          widthBorder: widget.widthFocusedErrorBorder ?? 2.5,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    required Color colorBorder,
    required double widthBorder,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: colorBorder,
        width: widthBorder,
      ),
    );
  }
}
