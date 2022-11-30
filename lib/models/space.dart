class Space {
  int id = 0;
  String name = '';
  double price = 0;
  String imageUrl = '';
  String city = '';
  String country = '';
  int rating = 0;
  String address = '';
  String phone = '';
  String mapUrl = '';
  List photos = [];
  int numberOfKitchens = 0;
  int numberOfBedrooms = 0;
  int numberOfCupboards = 0;

  Space({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toDouble();
    imageUrl = json['image_url'];
    city = json['city'];
    country = json['country'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }
}
