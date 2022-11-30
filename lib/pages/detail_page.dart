import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/btn_wishlist.dart';
import 'package:cozy/widgets/photo_detail.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/facility_item.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    urlLaunch(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
        // throw 'Could not launch $url';
      }
    }

    Future<void> confirmationDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Confirm',
            style: regularTextStyle,
          ),
          content: Text(
            'Do you want to book this space?',
            style: regularTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: Text(
                'Cancel',
                style: purpleTextStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                urlLaunch('tel:+${space.phone}');
                Navigator.pop(context, 'Yes');
              },
              child: Text(
                'Yes',
                style: purpleTextStyle,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //Title
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
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
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5]
                                  .map(
                                    (index) => Container(
                                        margin: EdgeInsets.only(
                                          left: 2,
                                        ),
                                        child: RatingItem(
                                          index,
                                          space.rating,
                                        )),
                                  )
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Main Facilities
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              amount: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imageUrl: 'assets/icon_bedroom.png',
                              amount: space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'big cupboard',
                              imageUrl: 'assets/icon_cupboard.png',
                              amount: space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      // Photos
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos
                              .map(
                                (item) => PhotoDetail(
                                  imageUrl: item,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Location
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyTextStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                urlLaunch(space.mapUrl);
                              },
                              icon: Image.asset(
                                'assets/icon_maps.png',
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          confirmationDialog();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width - 2 * edge,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset('assets/btn_back.png'),
                    iconSize: 40,
                  ),
                  BtnWishlist(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
