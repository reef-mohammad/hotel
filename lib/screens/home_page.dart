
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_database/components/hotels_card.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/services/supabase_service.dart';

import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return const AddCourseSheet();
            },
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        width: context.width,
        child: ListView(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder(
              future: SupabaseService().getHotels(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final list = snapshot.data ?? [];
                  return GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
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
        ),
      ),
    );
  }
}

class AddCourseSheet extends StatefulWidget {
  const AddCourseSheet({super.key});

  @override
  State<AddCourseSheet> createState() => _AddCourseSheetState();
}

class _AddCourseSheetState extends State<AddCourseSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    imageController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.9,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
              ),
              Space.spaceH8,
              TextField(
                controller: typeController,
                decoration: const InputDecoration(
                    labelText: 'Type', border: OutlineInputBorder()),
              ),
              Space.spaceH8,
              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                    labelText: 'Image Url', border: OutlineInputBorder()),
              ),
              ElevatedButton(
                onPressed: () async {
               
                },
                child: const Text('Book Room'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
