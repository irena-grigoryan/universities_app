class UniversityModel {
  String name;
  String country;

  UniversityModel({
    required this.name,
    required this.country,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      name: json['name'],
      country: json['country'],
    );
  }
}
