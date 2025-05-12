// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class CartModel {
  final String medicineId;
  final String medicineName;
  final int quantity;
  final double initialPrice;
  final double totalPrice;
  final String imageUrl;
  CartModel({
    required this.medicineId,
    required this.medicineName,
    required this.quantity,
    required this.initialPrice,
    required this.totalPrice,
    required this.imageUrl,
  });

  CartModel copyWith({
    String? medicineId,
    String? medicineName,
    int? quantity,
    double? initialPrice,
    double? totalPrice,
    String? imageUrl,
  }) {
    return CartModel(
      medicineId: medicineId ?? this.medicineId,
      medicineName: medicineName ?? this.medicineName,
      quantity: quantity ?? this.quantity,
      initialPrice: initialPrice ?? this.initialPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicineId': medicineId,
      'medicineName': medicineName,
      'quantity': quantity,
      'initialPrice': initialPrice,
      'totalPrice': totalPrice,
      'imageUrl': imageUrl,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      medicineId: map['medicineId'] as String,
      medicineName: map['medicineName'] as String,
      quantity: map['quantity'] as int,
      initialPrice: map['initialPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      imageUrl: map['imageUrl'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(medicineId: $medicineId, medicineName: $medicineName, quantity: $quantity, initialPrice: $initialPrice, totalPrice: $totalPrice, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.medicineId == medicineId &&
        other.medicineName == medicineName &&
        other.quantity == quantity &&
        other.initialPrice == initialPrice &&
        other.totalPrice == totalPrice &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return medicineId.hashCode ^
        medicineName.hashCode ^
        quantity.hashCode ^
        initialPrice.hashCode ^
        totalPrice.hashCode ^
        imageUrl.hashCode;
  }
}
