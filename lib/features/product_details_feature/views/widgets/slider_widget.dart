import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';




class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double value = 75;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: SquareThumb(),
        trackHeight: 5,
      ),
      child: Slider(
        padding: EdgeInsets.zero,
        value: value,
        min: 0,
        max: 100,
        activeColor: kPrimaryColor,
        inactiveColor: Color(
          0xffDCD8D3,
        ),
        onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
        },
      ),
    );
  }
}

class SquareThumb extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20, 20);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final rect = Rect.fromCenter(
      center: center,
      width: 13,
      height: 18,
    );

    final rRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(6), // الـ radius
    );
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        .5,
      );

    context.canvas.drawRRect(rRect, shadowPaint);
    context.canvas.drawRRect(
      rRect,
      Paint()..color = kPrimaryColor,
    );
  }
}
