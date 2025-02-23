class Order {
  int? id;
  final String customerName;
  final DateTime orderDate;
  final String itemName;
  final int quantity;
  final String unit; // 新增字段：货物单位
  final int isDeleted;

  Order({
    this.id,
    required this.customerName,
    required this.orderDate,
    required this.itemName,
    required this.quantity,
    required this.unit, // 新增参数
    this.isDeleted = 0,
  });

  Order.noUnit({
    this.id,
    required this.customerName,
    required this.orderDate,
    required this.itemName,
    required this.quantity,
    this.isDeleted = 0,
  }) : unit = ''; // 兼容旧数据

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customerName': customerName,
      'orderDate': orderDate.toIso8601String(),
      'itemName': itemName,
      'quantity': quantity,
      'unit': unit,
      'isDeleted': isDeleted,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int?,
      customerName: map['customerName'] as String,
      orderDate: DateTime.parse(map['orderDate'] as String),
      itemName: map['itemName'] as String,
      quantity: map['quantity'] as int,
      unit: map['unit'] as String? ?? '', // 兼容旧数据
      isDeleted: map['isDeleted'] as int,
    );
  }
}