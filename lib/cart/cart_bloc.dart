import 'package:ecommerce/Item/itempage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<Item> cartItems = [];

  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) {
      cartItems.add(event.item);
      emit(CartUpdated(List.from(cartItems)));
    });

    on<RemoveFromCart>((event, emit) {
      cartItems.remove(event.item);
      if (cartItems.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartUpdated(List.from(cartItems)));
      }
    });

    on<ClearCart>((event, emit) {
      cartItems.clear();
      emit(CartEmpty());
    });
  }
}
