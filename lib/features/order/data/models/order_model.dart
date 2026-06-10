class Order {
  final int id;
  final String orderCode;
  final String orderDate;
  final String status;
  final String total;

  Order({
    required this.id,
    required this.orderCode,
    required this.orderDate,
    required this.status,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderCode: json['order_code'],
      orderDate: json['order_date'],
      status: json['status'],
      total: json['total'],
    );
  }
}

class OrderMeta {
  final int total;
  final int perPage;
  final int currentPage;
  final int lastPage;

  OrderMeta({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  factory OrderMeta.fromJson(Map<String, dynamic> json) {
    return OrderMeta(
      total: json['total'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      lastPage: json['last_page'],
    );
  }
}

class OrdersData {
  final List<Order> orders;
  final OrderMeta meta;

  OrdersData({required this.orders, required this.meta});

  factory OrdersData.fromJson(Map<String, dynamic> json) {
    return OrdersData(
      orders: List<Order>.from(json['orders'].map((e) => Order.fromJson(e))),
      meta: OrderMeta.fromJson(json['meta']),
    );
  }
}

class OrdersResponse {
  final OrdersData data;
  final String message;
  final List<dynamic> error;
  final int status;

  OrdersResponse({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      data: OrdersData.fromJson(json['data']),
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'],
    );
  }
}
