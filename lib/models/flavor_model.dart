class FlavorModel {
  String id;
  String name;
  String description;
  String category;
  String tobaccoType;
  String brand;
  double intensity;
  double price;
  List<String> flavorNotes;
  double amount;
  String imagePath;

  FlavorModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.tobaccoType,
    required this.brand,
    required this.intensity,
    required this.price,
    required this.flavorNotes,
    required this.amount,
    required this.imagePath,
  });
}
