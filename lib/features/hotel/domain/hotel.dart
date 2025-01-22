class Hotel {
  int id;
  String name;
  String adress;
  int minimalPrice;
  String priceForIt;
  int rating;
  String ratingName;
  List<String> imageUrls;
  AboutTheHotel aboutTheHotel;

  Hotel(
      {required this.id,
      required this.name,
      required this.adress,
      required this.minimalPrice,
      required this.priceForIt,
      required this.rating,
      required this.ratingName,
      required this.imageUrls,
      required this.aboutTheHotel});
}

class AboutTheHotel {
  String description;
  List<String> peculiarities;

  AboutTheHotel({required this.description, required this.peculiarities});
}

