class Reservations {
  String? reservation_id;
  int? total_price;
  String? checkInDate;
  String? userId;
  String? hotelId;
  DateTime? checkOutDate;

  Reservations(
      {this.reservation_id,
      this.total_price,
      this.checkInDate,
      this.userId,
      this.hotelId,
      this.checkOutDate});

  Reservations.fromJson(Map<String, dynamic> json) {
    reservation_id = json['reservation_id'];
    total_price = json['total_price'];
    checkInDate = json['check_in_date'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    checkOutDate = json['check_out_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reservation_id'] = this.reservation_id;
    data['total_price'] = this.total_price;
    data['check_in_date'] = this.checkInDate;
    data['user_id'] = this.userId;
    data['hotel_id'] = this.hotelId;
    data['check_out_date'] = this.checkOutDate;

    return data;
  }
}
