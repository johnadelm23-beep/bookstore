class GovernorateModel {
  final int id;
  final String nameEn;

  GovernorateModel({required this.id, required this.nameEn});

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      id: json['id'],
      nameEn: json['governorate_name_en'],
    );
  }
}
