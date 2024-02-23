import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository _prodRepository;

  ProductBloc(this._prodRepository) : super(ProductLoadingState()) {
    on<LoadProductListEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        debugPrint("Fetching Song List...");
        final song = await _prodRepository.getProducts();
        emit(ProductLoadedState(song.leads ?? List.empty()));
      } catch (e) {
        debugPrint("Printing Error: $e");
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
