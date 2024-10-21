import 'package:ecommerce/Item/itempage.dart';
import 'package:equatable/equatable.dart';


abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Item item;

  AddToCart(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveFromCart extends CartEvent {
  final Item item;

  RemoveFromCart(this.item);

  @override
  List<Object> get props => [item];
}

class ClearCart extends CartEvent {}
