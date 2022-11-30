import 'package:flutter/material.dart';
import '../theme.dart';

class FacilityItem extends StatelessWidget {
  final int amount;
  final String name;
  final String imageUrl;
  FacilityItem({
    required this.amount,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          height: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: amount.toString(),
            style: purpleTextStyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: ' $name',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
