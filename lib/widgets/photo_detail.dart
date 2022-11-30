import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class PhotoDetail extends StatelessWidget {
  final String imageUrl;

  PhotoDetail({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: edge,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            width: 110,
            height: 88,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
