import 'package:cozy/models/space.dart';
import 'package:cozy/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cozy/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  const SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(space),
          ),
        );
      }),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl,
                    height: 110,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            height: 18,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${space.rating}/5',
                            style: whiteTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${space.city}, ${space.country}',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
