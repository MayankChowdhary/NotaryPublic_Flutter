

part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState extends Equatable {}

class ProductLoadingState extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductListState {
  final List<Leads> items;

  ProductLoadedState(this.items);

  @override
  List<Object?> get props => [items];
}

class ProductErrorState extends ProductListState {
  final String error;

  ProductErrorState(this.error);

  @override
  List<Object?> get props => [error];
}