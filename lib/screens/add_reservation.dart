import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/models/hotel_room_model.dart';
import 'package:hotel_database/models/reservations_model.dart';
import 'package:hotel_database/screens/book_screen.dart';
import 'package:hotel_database/services/supabase_service.dart';
import 'package:intl/intl.dart';

import 'package:uuid/uuid.dart';

class AddReservation extends StatefulWidget {
  const AddReservation({
    super.key,
    required this.hotel,
  });
  final Hotel hotel;
  @override
  State<AddReservation> createState() => _AddReservationState();
}

class _AddReservationState extends State<AddReservation> {
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
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter  check in Date" //label text of field
                    ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      nameController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),
              Space.spaceH8,
              TextField(
                controller: typeController,
                decoration: const InputDecoration(
                    labelText: 'Hotel Id', border: OutlineInputBorder()),
              ),
              Space.spaceH8,
              TextField(
                controller: imageController,
                decoration: const InputDecoration(
                    labelText: 'total', border: OutlineInputBorder()),
              ),
              ElevatedButton(
                onPressed: () async {
                  final id = const Uuid().v4();
                  await SupabaseService().addReservation(
                    Reservations(
                      reservation_id: id,
                      //  hotelId: widget.hotel.hotelId ?? 'f',
                      checkInDate: nameController.text,
                      total_price: int.parse(imageController.text),
                      //userId: typeController.text,
                    ),
                  );
                  if (context.mounted) {
                    BookingPage().push(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
