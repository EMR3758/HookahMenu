class MixModel {
  final String id;
  final String name;
  final String description;
  final Map<String, double> ingredients;
  final int intensity;
  final bool isFavorite;
  final String mixType;
  final String mixTobaccoType;
  final int mixWeight;
  final List<String> similarMixes;

  MixModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.intensity,
    required this.isFavorite,
    required this.mixType,
    required this.mixTobaccoType,
    required this.mixWeight,
    required this.similarMixes,
  });
}
