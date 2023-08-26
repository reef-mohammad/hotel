import 'package:flutter/material.dart';
import 'package:hotel_database/models/reservations_model.dart';
import 'package:uuid/uuid.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Reservations reservation;

  final TextEditingController hotelIdController = TextEditingController();
  final TextEditingController checkInDateController = TextEditingController();
  final TextEditingController totalPriceController = TextEditingController();
  final TextEditingController customerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Booking')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: hotelIdController,
                decoration: const InputDecoration(labelText: 'Hotel ID'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter hotel ID' : null,
              ),
              TextFormField(
                controller: checkInDateController,
                decoration: const InputDecoration(
                    labelText: 'Check In Date (YYYY-MM-DD)'),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter check in date';
                  try {
                    DateTime.parse(value);
                    return null;
                  } catch (e) {
                    return 'Invalid date format';
                  }
                },
              ),
              TextFormField(
                controller: totalPriceController,
                decoration: const InputDecoration(labelText: 'Total Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter total price' : null,
              ),
              TextFormField(
                controller: customerIdController,
                decoration: const InputDecoration(labelText: 'Customer ID'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter customer ID' : null,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit Booking'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final id = const Uuid().v4();
      reservation = Reservations(
        reservation_id: id,
        hotelId: hotelIdController.text,
        checkInDate: '2023-02-13',
        total_price: int.parse(totalPriceController.text),
      );

      /*    try {
        // Store the booking in the database
        await DatabaseService().createBooking(reservation); // Note: You need to add createBooking method to your DatabaseService
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking created successfully!'))
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating booking: $e'))
        );
      }*/
    }
  }
}
