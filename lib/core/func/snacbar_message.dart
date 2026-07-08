import 'package:flutter/material.dart';

import '../utils/constant.dart';

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
      backgroundColor: isError
          ? const Color(0xFFe57373)
          : const Color(0xFF66BB6A),
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

void snackBarMessageOverlay(
  BuildContext context, {
  required String message,
  bool isError = true,
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          color: isError ? const Color(0xFFe57373) : const Color(0xFF66BB6A),
          child: SafeArea(
            top: false,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
