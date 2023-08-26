import 'dart:developer';

import 'package:hotel_database/models/hotel_room_model.dart';
import 'package:hotel_database/models/reservations_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final client = Supabase.instance.client;

  Future<List<Hotel>?> getHotels() async {
    final rawCourses = await client.from("hotel_room").select(
        "image, hotel_name,city,description,price,reviews,rate,location");

    final List<Hotel> hotels = [];
    for (final hotel in rawCourses) {
      hotels.add(Hotel.fromJson(hotel));
    }
    log(hotels.toString());
    return hotels;
  }
 
  Future<List<Hotel>?> getReservationsByHotelId(String userId) async {
    final supabase = Supabase.instance.client;
    var hotelId = await supabase
        .from('reservation')
        .select('hotel_id')
        .eq('user_id', userId);
         await supabase
        .from('hotel')
        .select('hotel_name,city,price')
        .eq('hotel_id', hotelId);

    final List<Hotel> reservations = [];
    for (final reservation in hotelId) {
      reservations.add(Hotel.fromJson(reservation));
    }
    return reservations;
  }

  Future<List<Reservations>> getInstructors() async {
    final supabase = Supabase.instance.client;
    final rawhotels = await supabase.from('reservation').select('hotel_id');
    final List<Reservations> reservations = [];
    for (final course in rawhotels) {
      reservations.add(Reservations.fromJson(course));
    }
    return reservations;
  }

  Future<List<Reservations>?> getReservations() async {
    final rawCourses = await client.from("reservation").select("total");

    final List<Reservations> reservations = [];
    for (final reservation in rawCourses) {
      reservations.add(Reservations.fromJson(reservation));
    }
    log(reservations.toString());
    return reservations;
  }

  Future<List<Hotel>?> getDetailedHotels() async {
    final rawCourses = await client.from("hotel_room").select(
        "image, hotel_name,description,price,reviews,rate,city,location");
    final List<Hotel> hotels = [];
    for (final hotel in rawCourses) {
      hotels.add(Hotel.fromJson(hotel));
    }
    return hotels;
  }

  Future addReservation(Reservations reservation) async {
    final supabase = Supabase.instance.client;
    await supabase.from('reservation').insert(reservation.toJson());
  }



  Future<List<Hotel>?> getCities() async {
    final supabase = Supabase.instance.client;
    final rawCourses = await supabase.from('hotel_room').select('city');
    final List<Hotel> hotels = [];
    for (final hotel in rawCourses) {
      hotels.add(Hotel.fromJson(hotel));
    }
    return hotels;
  }


}
