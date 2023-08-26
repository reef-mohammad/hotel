/* Text(hotel.city ?? 'No city name'),
                      Text(hotel.location ?? 'No location name'),
                      Text(hotel.description ?? 'No description name'),
                      Text(hotel.price ?? 'No price name'),
                      Text(hotel.rate ?? 'No rate name'),
                      Text(hotel.facilites ?? 'No facilities name'),
                      Text(hotel.reviews ?? 'No reviews name'),*/
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/models/hotel_room_model.dart';
import 'package:hotel_database/screens/detailes.dart';

class DetailesCard extends StatelessWidget {
  const DetailesCard({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                hotel.image ?? 'https://demofree.sirv.com/nope-not-here.jpg',
            errorWidget: (context, url, s) {
              return Container(color: Colors.red);
            },
            width: 300,
            fit: BoxFit.fill,
          ),
          Space.spaceH8,
          Text(
            hotel.hotelName ?? 'No name',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
          ),
          Space.spaceH8,
          Row(
            children: [
              Text(
                hotel.city ?? 'No City',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue),
              ),
              Space.spaceH8,
              Text(
                hotel.location ?? 'No location',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue),
              ),
            ],
          ),
          Space.spaceH8,
          Text(
            "${hotel.rate} ",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
          ),
          Space.spaceH16,
          Space.spaceH16,
          Text(
            hotel.description ?? 'No description',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
          ),
          Space.spaceH32,
          Text(
            "${hotel.price} ",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
