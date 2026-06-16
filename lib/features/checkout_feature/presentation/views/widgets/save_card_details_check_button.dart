import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class SaveCardDetailsCheckButton extends StatefulWidget {
  const SaveCardDetailsCheckButton({
    super.key,
  });

  @override
  State<SaveCardDetailsCheckButton> createState() =>
      _SaveCardDetailsCheckButtonState();
}

class _SaveCardDetailsCheckButtonState
    extends State<SaveCardDetailsCheckButton> {
  bool saveCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          saveCardDetails = !saveCardDetails;
        });
      },
      child: Container(
        width: 23,
        height: 23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: saveCardDetails ? Colors.red : Colors.grey,
        ),
        child: Icon(
          size: 16,
          fontWeight: FontWeight.bold,
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
