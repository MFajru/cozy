import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  NavBarItem({required this.imageUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
          height: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                height: 2,
                width: 30,
                decoration: BoxDecoration(
                  color: Color(0xff7F74EB),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
