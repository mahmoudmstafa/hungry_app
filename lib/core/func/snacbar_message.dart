import 'package:flutter/material.dart';

void snackBarMessage(
    BuildContext context, {
      required String message,
      bool isError = true,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 0),
      duration: const Duration(seconds: 3),
      backgroundColor:
      isError ? const Color(0xFFe57373) : const Color(0xFF66BB6A),
      content: Center(
        child: Text(
          textAlign: TextAlign.center,
          message,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
