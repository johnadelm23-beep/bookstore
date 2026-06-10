class OrderHistoryModel {
  final List<OrderModel> orders;

  OrderHistoryModel({required this.orders});

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      orders: List<OrderModel>.from(
        json['data']['orders'].map((e) => OrderModel.fromJson(e)),
      ),
    );
  }
}

class OrderModel {
  final int id;
  final String orderCode;
  final String orderDate;
  final String status;
  final String total;

  OrderModel({
    required this.id,
    required this.orderCode,
    required this.orderDate,
    required this.status,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderCode: json['order_code'],
      orderDate: json['order_date'],
      status: json['status'],
      total: json['total'],
    );
  }
}
