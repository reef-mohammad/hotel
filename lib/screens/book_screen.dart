import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_database/screens/add_reservation.dart';
import 'package:hotel_database/services/supabase_service.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4964FE), Color(0xFF27B7FE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Center(
            child: Text('Book Room'),
          ),
        ),
        body: FutureBuilder(
            future: SupabaseService().getHotels(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final hotels = snapshot.data ?? [];
                for (final hotel in hotels) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20.0),
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "${hotel.hotelName}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                const Text(
                                  '13 Nov, 18 Nov, 8 nights,\n 1 Room, 2 Adults',
                                  style: TextStyle(color: Color(0xFF9C9DA0)),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "${hotel.image}",
                                  fit: BoxFit.fitHeight,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 170,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        height: 3,
                        color: const Color(0xFFd9d9d9),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '  "${hotel.price}" X 5 nights',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${hotel.price}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        hintText: 'code',
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF4964FE)),
                                  ),
                                  child: const Text('Add Coupon '),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        height: 3,
                        color: const Color(0xFFd9d9d9),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total (USD)',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text("${hotel.price}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      // Spacer(),
                      const SizedBox(height: 40),
                      Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF4964FE), Color(0xFF27B7FE)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return AddReservation(
                                  hotel: hotel,
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF4964FE)),
                          ),
                          child: const Text('Book Now'),
                        ),
                      )
                    ],
                  );
                }
              }
              return const SizedBox.shrink();
            }));
  }
}
