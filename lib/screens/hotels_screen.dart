import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/models/hotel_room_model.dart';
import 'package:hotel_database/services/supabase_service.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          CachedNetworkImage(
            imageUrl: hotel.image ?? '',
            width: 500,
          ),
          Space.spaceH16,
          FutureBuilder(
            future: SupabaseService().getHotels(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final hotels = snapshot.data ?? [];
                return ListView(
                  shrinkWrap: true,
                  children: [
                    for (final hotel in hotels) ...[
                      Text(hotel.hotelName ?? 'No hotel name'),
                    ]
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
          ElevatedButton(
            onPressed: () {
              // SupabaseService().deleteCourse(course.courseId ?? '');
            },
            child: const Text('Book Room'),
          ),
        ],
      ),
    );
  }
}
