import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/Core/constants/constants.dart';
import '../../../Models/cart_model.dart';
import '../controller/cart_controller.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  void deleteCartItem(
      WidgetRef ref, CartModel cartModel, BuildContext context) async {
    try {
      await ref.read(cartControllerProvider).deleteItem(cartModel);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Deleted from cart successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void updateCartQuantity(WidgetRef ref, CartModel cartModel, int newQuantity,
      BuildContext context) async {
    try {
      await ref
          .read(cartControllerProvider)
          .updateQuantity(cartModel, newQuantity);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsAsync = ref.watch(getCartItemsProvider);
    final totalPriceAsync = ref.watch(totalPriceStreamProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.white,
      ),
      body: cartItemsAsync.when(
        data: (data) {
          return Column(
            children: [
              Expanded(
                child: data.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(Constants.emptyCartPath),
                          const SizedBox(height: 20),
                          Text('Your cart is empty 😌',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: 20),
                          Text(
                            'Explore products and shop your\nfavourite items',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final cartItem = data[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        cartItem.imageUrl,
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(cartItem.medicineName,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Quantity: ${cartItem.quantity}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey)),
                                          const SizedBox(height: 5),
                                          Text(
                                              'Price: \$${cartItem.totalPrice}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          deleteCartItem(ref, cartItem, context),
                                      icon: const Icon(Icons.delete),
                                      color: Colors.red,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (cartItem.quantity > 1) {
                                              updateCartQuantity(
                                                  ref,
                                                  cartItem,
                                                  cartItem.quantity - 1,
                                                  context);
                                            }
                                          },
                                          icon: const Icon(Icons.remove),
                                          color: Colors.grey,
                                        ),
                                        Text(cartItem.quantity.toString(),
                                            style:
                                                const TextStyle(fontSize: 18)),
                                        IconButton(
                                          onPressed: () {
                                            updateCartQuantity(
                                                ref,
                                                cartItem,
                                                cartItem.quantity + 1,
                                                context);
                                          },
                                          icon: const Icon(Icons.add),
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              if (data.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: totalPriceAsync.when(
                    data: (totalPrice) => Column(
                      children: [
                        Text(
                          'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Confirm order logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            icon: const Icon(Icons.check_circle_outline,
                                color: Colors.white, size: 26),
                            label: const Text('Confirm The Order',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (e, _) => Text('Error: $e'),
                  ),
                ),
            ],
          );
        },
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

