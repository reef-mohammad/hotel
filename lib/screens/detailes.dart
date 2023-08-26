import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:hotel_database/components/facilities.dart';
import 'package:hotel_database/constant/colors.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/models/hotel_room_model.dart';
import 'package:hotel_database/screens/book_screen.dart';
import 'package:hotel_database/services/supabase_service.dart';

class DetailesScreen extends StatelessWidget {
  const DetailesScreen({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder(
              future: SupabaseService().getDetailedHotels(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          CachedNetworkImage(
                            imageUrl: hotel.image ?? '',
                            width: 100,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                hotel.hotelName ?? 'No hotel name',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    " ${hotel.rate}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                hotel.city ?? 'No city name',
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: grey,
                                    fontSize: 14),
                              ),
                              Text(
                                hotel.location ?? 'No location name',
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: grey,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Space.spaceH8,
                          const Text('Facilities',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const Facilities(),
                          Space.spaceH16,
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Space.spaceH8,
                          Text(hotel.description ?? 'No sesc '),
                          Space.spaceH8,
                          const Text(
                            "Reviews",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Space.spaceH8,
                          Row(
                            children: [
                              const Text(
                                "Adam Smith",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(" ${hotel.rate}"),
                            ],
                          ),
                          Text(hotel.reviews ?? 'No revi '),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ ${hotel.price} ",
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Space.spaceW32,
                                SizedBox(
                                  width: context.width * 0.5,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      const BookingPage().push(context);
                                    },
                                    child: const Text('Book Room'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
