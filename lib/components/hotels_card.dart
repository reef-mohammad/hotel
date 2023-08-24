import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
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
        Detailes().push(context);
      },
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 10,
        color: Colors.blue,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: hotel.image ??
                    'https://demofree.sirv.com/nope-not-here.jpg',
                errorWidget: (context, url, s) {
                  return Container(color: Colors.red);
                },
                width: 300,
                fit: BoxFit.cover,
              ),
              Space.spaceH8,
              Text(
                hotel.hotelName ?? 'No name',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }
}
