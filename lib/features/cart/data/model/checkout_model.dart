class CheckoutModel {
  final int id;
  final String total;

  CheckoutModel({required this.id, required this.total});

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(id: json['data']['id'], total: json['data']['total']);
  }
}
