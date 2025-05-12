import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Core/typedef.dart';
import '../../../Models/cart_model.dart';
import '../reposito/cart_repository.dart';

final cartControllerProvider = Provider((ref) {
  return CartController(cartRepository: ref.read(cartRepositoryProvider));
});

final getCartItemsProvider = StreamProvider((ref) {
  return ref.watch(cartControllerProvider).getCartItems();
});

final totalPriceStreamProvider = StreamProvider.autoDispose<double>((ref) {
  return ref.watch(cartControllerProvider).calculateTotalPrice();
});

class CartController {
  final CartRepository _cartRepository;
  CartController({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  FutureVoid addToCart(CartModel cartModel) async {
    return _cartRepository.addToCart(cartModel);
  }

  Stream<List<CartModel>> getCartItems() {
    return _cartRepository.getCartItems();
  }

  FutureVoid deleteItem(CartModel cartModel) async {
    return _cartRepository.deleteItem(cartModel);
  }

  FutureVoid updateQuantity(CartModel cartModel, int newQuantity) async {
    return _cartRepository.updateQuantity(cartModel, newQuantity);
  }

  Stream<double> calculateTotalPrice()  {
    return _cartRepository.calculateTotalPrice();
  }

    
  
}

// class TotalPriceNotifier extends StateNotifier<double> {
//   final CartController _cartController;

//   TotalPriceNotifier(this._cartController) : super(0.0) {
//     _initializeTotalPrice();
//   }

//   void _initializeTotalPrice() async {
//     state = await _cartController.calculateTotalPrice();
//   }

//   void updateTotalPrice() async {
//     state = await _cartController.calculateTotalPrice();
//   }
// }
