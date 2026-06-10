class PlaceOrderModel {
  final int id;

  PlaceOrderModel({required this.id});

  factory PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    return PlaceOrderModel(id: json['data']['id']);
  }
}
