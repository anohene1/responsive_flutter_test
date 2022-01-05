import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class ChatItem extends StatelessWidget {

  final RandomColor _randomColor = RandomColor();


  static const int minHeight = 50;
  static const int maxHeight = 100;
  static const double bubbleRoundedRadius = 20;

  static const int minCount = 1;
  static const int maxCount = 4;

  final _randomHeight = new Random();
  final _randomCount = new Random();
  final _randomSide = new Random();

  int getBubbleHeight() => minHeight + _randomHeight.nextInt(maxHeight - minHeight);
  int getListItemCount() => minCount + _randomCount.nextInt(maxCount - minCount);
  int decideSide() => 0 + _randomSide.nextInt(2);

  @override
  Widget build(BuildContext context) {
    int side = decideSide();
    Color profileIconColor = _randomColor.randomColor();

    return Container(
      color: Colors.white,
      child: side == 0
          ? Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 8.0,
          right: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: profileIconColor,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 5.0),
                itemCount: getListItemCount(),
                itemBuilder: (context, index) {
                  return Container(
                    height: getBubbleHeight().toDouble(),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(bubbleRoundedRadius),
                        bottomRight: Radius.circular(bubbleRoundedRadius),
                        topRight: Radius.circular(bubbleRoundedRadius),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )
          : Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 16.0,
          right: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 5.0),
                itemCount: getListItemCount(),
                itemBuilder: (context, index) {
                  return Container(
                    height: getBubbleHeight().toDouble(),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(bubbleRoundedRadius),
                        bottomRight: Radius.circular(bubbleRoundedRadius),
                        topLeft: Radius.circular(bubbleRoundedRadius),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 8.0),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}