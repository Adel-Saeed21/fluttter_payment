class BillingDataModel {
  final String apartment;
  final String firstName;
  final String lastName;
  final String street;
  final String building;
  final String phoneNumber;
  final String city;
  final String country;
  final String email;
  final String floor;
  final String state;

  BillingDataModel({
    required this.apartment,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.building,
    required this.phoneNumber,
    required this.city,
    required this.country,
    required this.email,
    required this.floor,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      "apartment": apartment,
      "first_name": firstName,
      "last_name": lastName,
      "street": street,
      "building": building,
      "phone_number": phoneNumber,
      "city": city,
      "country": country,
      "email": email,
      "floor": floor,
      "state": state,
    };
  }

  factory BillingDataModel.fromJson(Map<String, dynamic> json) {
    return BillingDataModel(
      apartment: json["apartment"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      street: json["street"] ?? "",
      building: json["building"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      city: json["city"] ?? "",
      country: json["country"] ?? "",
      email: json["email"] ?? "",
      floor: json["floor"] ?? "",
      state: json["state"] ?? "",
    );
  }
}