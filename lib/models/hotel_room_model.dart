import 'dart:ffi';

class Hotel {
  String? hotelId;
  String? hotelName;
  String? image;
  String? city;
  String? location;
  String? description;
  int? price;
  dynamic rate;
  List<Facility>? facilites;

  String? reviews;

  Hotel(
      {this.hotelId,
      this.hotelName,
      this.image,
      this.city,
      this.location,
      this.description,
      this.price,
      this.rate,
      this.facilites,
      this.reviews});

  Hotel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    hotelName = json['hotel_name'];
    image = json['image'];
    city = json['city'];
    location = json['location'];
    description = json['description'];
    price = json['price'];
    rate = json['rate'];
    facilites = (json['facilities']?['facilities'] as List?)
        ?.map((e) => Facility.fromJson(e))
        .toList();

    facilites = json['facilites'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel_id'] = this.hotelId;
    data['hotel_name'] = this.hotelName;
    data['image'] = this.image;
    data['city'] = this.city;
    data['location'] = this.location;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rate'] = this.rate;
    
    data['facilites'] = this.facilites;
    data['reviews'] = this.reviews;
    return data;
  }
}
class Facility {
  final String facility;

  Facility({ required this.facility});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      
      facility: json['facility'],
    );
  }
}