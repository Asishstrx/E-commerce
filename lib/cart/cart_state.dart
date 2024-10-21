import 'package:ecommerce/Item/itempage.dart';
import 'package:equatable/equatable.dart';


abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}
class CartLoaded extends CartState {
  final List<Item> cartItems;

  CartLoaded({required this.cartItems});
}

class CartUpdated extends CartState {
  final List<Item> items;

  CartUpdated(this.items);

  @override
  List<Object> get props => [items];
}

class CartEmpty extends CartState {}
