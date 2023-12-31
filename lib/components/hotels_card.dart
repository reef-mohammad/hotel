import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:hotel_database/constant/colors.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/models/hotel_room_model.dart';
import 'package:hotel_database/screens/detailes.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DetailesScreen(
          hotel: hotel,
        ).push(context);
      },
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            height: 230,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: hotel.image ??
                      'https://demofree.sirv.com/nope-not-here.jpg',
                  errorWidget: (context, url, s) {
                    return Container(color: white);
                  },
                  width: 200,
                  height: 110,
                  fit: BoxFit.cover,
                ),
                Space.spaceH8,
                Text(
                  hotel.hotelName ?? 'No name',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: textBlack),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        hotel.city ?? 'No City',
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: grey),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        hotel.location ?? 'No loc',
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: grey),
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Space.spaceH32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${hotel.price} /night ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: grey),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Text(
                          "${hotel.rate} ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
