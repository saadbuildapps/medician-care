import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../Core/constants/firebase_constants.dart';
import '../../../Core/failure.dart';
import '../../../Core/providers/firebaseproviders.dart';
import '../../../Core/typedef.dart';
import '../../../Models/cart_model.dart';

final cartRepositoryProvider = Provider((ref) {
  return CartRepository(firestore: ref.read(firestoreProvider));
});

class CartRepository {
  final FirebaseFirestore _firestore;
  CartRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  FutureVoid addToCart(CartModel cartModel) async {
    try {
      final document = await _cart.doc(cartModel.medicineId).get();
      if (document.exists) {
        throw Exception("Cart already exists");
      }
      return right(_cart.doc(cartModel.medicineId).set(cartModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<CartModel>> getCartItems() {
    return _cart.snapshots().map((event) {
      return event.docs
          .map((doc) => CartModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  FutureVoid deleteItem(CartModel cartModel) async {
    try {
      return right(_cart.doc(cartModel.medicineId).delete());
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid updateQuantity(CartModel cartModel, int newQuantity) async {
    try {
      return right(_cart.doc(cartModel.medicineId).update({
        'quantity': newQuantity,
        'totalPrice': cartModel.initialPrice * newQuantity,
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // Future<double> calculateTotalPrice() async {
  //   try {
  //     final snapshot = await _cart.get();
  //     double totalPrice = 0.0;
  //     for (var doc in snapshot.docs) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       totalPrice += data['totalPrice'] ?? 0.0;
  //     }
  //     return totalPrice;
  //   } catch (e) {
  //     throw Exception("Error calculating total price: $e");
  //   }
  // }



  Stream<double> calculateTotalPrice() {
    return _cart.snapshots().map((snapshot) {
      double total = 0;
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        total += (data['totalPrice'] ?? 0.0) as double;
      }
      return total;
    });
  }
  CollectionReference get _cart =>
      _firestore.collection(FirebaseConstants.cartCollection);
}
