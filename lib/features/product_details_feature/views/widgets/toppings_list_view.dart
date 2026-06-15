import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/features/product_details_feature/views/widgets/editing_widget.dart';

class ToppingsListView extends StatelessWidget {
  const ToppingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: 8,
          left: 20,
          right: 20,
        ),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return EditingWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}
