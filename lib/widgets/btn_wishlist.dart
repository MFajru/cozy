import 'package:flutter/material.dart';

class BtnWishlist extends StatefulWidget {
  const BtnWishlist({super.key});

  @override
  State<BtnWishlist> createState() => _BtnWishlistState();
}

class _BtnWishlistState extends State<BtnWishlist> {
  bool isWishlist = false;
  void toggleWishList() {
    setState(() {
      isWishlist = !isWishlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        toggleWishList();
      },
      icon: isWishlist
          ? Image.asset('assets/btn_wishlist_active.png')
          : Image.asset('assets/btn_wishlist.png'),
      iconSize: 40,
    );
  }
}
