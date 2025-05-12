
// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineModel {
   String? id;
  String? name;
  String? generic;
  String? description;
  String? imageUrl;
  String? manufacturer;
  String? type;
  int? quantity;
  int? price;
  String? expiryDate;
  DateTime? timestamp;

  MedicineModel({
    this.id,
    this.name,
    this.generic,
    this.description,
    this.imageUrl,
    this.manufacturer,
    this.type,
    this.quantity,
    this.price,
    this.expiryDate,
    this.timestamp,
  });

  MedicineModel copyWith({
    String? id,
    String? name,
    String? generic,
    String? description,
    String? imageUrl,
    String? manufacturer,
    String? type,
    int? quantity,
    int? price,
    String? expiryDate,
    DateTime? timestamp,
  }) {
    return MedicineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      generic: generic ?? this.generic,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      manufacturer: manufacturer ?? this.manufacturer,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      expiryDate: expiryDate ?? this.expiryDate,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'generic': generic,
      'description': description,
      'imageUrl': imageUrl,
      'manufacturer': manufacturer,
      'type': type,
      'quantity': quantity,
      'price': price,
      'expiryDate': expiryDate,
      'timestamp': timestamp,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic> map, String id) {
  return MedicineModel(
    id: id,
    name: map['name'] ,
    generic: map['generic'],
    description: map['description'],
    imageUrl: map['imageUrl'],
    manufacturer: map['manufacturer'],
    type: map['type'],
    quantity: map['quantity'],
    price: map['price'],
    expiryDate: map['expiryDate'],
    timestamp: map['timestamp'] != null
        ? (map['timestamp'] as Timestamp).toDate()
        : null,
  );
}


// factory MedicineModel.fromJson(String source) {
//   final data = json.decode(source);
//   return MedicineModel.fromMap(data, data['id']);
// }


  @override
  String toString() {
    return 'MedicineModel(id: $id, name: $name, generic: $generic, description: $description, imageUrl: $imageUrl, manufacturer: $manufacturer, type: $type, quantity: $quantity, price: $price, expiryDate: $expiryDate, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant MedicineModel other) {
    return other.id == id &&
        other.name == name &&
        other.generic == generic &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.manufacturer == manufacturer &&
        other.type == type &&
        other.quantity == quantity &&
        other.price == price &&
        other.expiryDate == expiryDate &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        generic.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        manufacturer.hashCode ^
        type.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        expiryDate.hashCode ^
        timestamp.hashCode;
  }
}
