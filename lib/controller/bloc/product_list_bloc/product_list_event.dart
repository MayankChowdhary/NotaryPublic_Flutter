part of 'product_list_bloc.dart';

@immutable
abstract class ProductListEvent extends Equatable {
  const ProductListEvent();
}

class LoadProductListEvent extends ProductListEvent {
  @override
  List<Object> get props => [];
}
