import 'package:flutter/material.dart';

import 'editing_widget.dart';


class SideOptionListView extends StatelessWidget {
  const SideOptionListView({super.key});

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
          return EditingWidget(
            isToppings: false,
          );
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
