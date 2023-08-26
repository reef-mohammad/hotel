import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_database/components/hotels_card.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/services/supabase_service.dart';

import 'package:uuid/uuid.dart';

class HotelsList extends StatefulWidget {
  const HotelsList({super.key});

  @override
  State<HotelsList> createState() => _HotelsListState();
}

class _HotelsListState extends State<HotelsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width,
        height: 250,
        child: ListView(
          shrinkWrap: true,

          scrollDirection: Axis.horizontal,

       
          children: [
            FutureBuilder(
              future: SupabaseService().getHotels(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final list = snapshot.data ?? [];
                  return Row(
                    children: [
                      for (final hotel in list) ...[
                        HotelCard(
                          hotel: hotel,
                        ),
                      ]
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ));
  }
}
