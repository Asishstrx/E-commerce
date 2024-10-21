// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:ecommerce/checkout/checkout.dart';

import 'package:ecommerce/checkout/notificationservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_bloc.dart';
import 'cart_state.dart';
import 'cart_event.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final checkoutService = CheckoutService();
  final notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Your Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return Center(
              child: Text('Your cart is empty'),
            );
          } else if (state is CartUpdated) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  leading: Image.asset(
                    item.imageurl,
                    height: 55,
                    width: 100,
                  ),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(RemoveFromCart(item));
                    },
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated && state.items.isNotEmpty) {
            final total =
                state.items.fold<double>(0.0, (sum, item) => sum + item.price);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      
                      await checkoutService.storeOrderInFirebase(state.items);

                     
                      await notificationService.showOrderNotification();

                      BlocProvider.of<CartBloc>(context).add(ClearCart());

                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Order placed successfully!\nTotal Amount:\$${total.toStringAsFixed(2)}')),
                      );
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
