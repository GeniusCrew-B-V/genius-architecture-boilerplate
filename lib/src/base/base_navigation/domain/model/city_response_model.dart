class CityResponseModel {
  final String name;
  final String id;
  final String? color;
  final String? image;

  CityResponseModel({
    this.color,
    this.image,
    required this.name,
    required this.id,
  });
}
