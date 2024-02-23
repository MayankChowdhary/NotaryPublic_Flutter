import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:notary_public_flutter/data/models/flunkey_model.dart';

import '../../utils/constants/connection_types.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {

  SearchCubit() : super(SearchLoading()) {}

  void startSearch(String keyWord, List<Leads> dataList) {
    List<Leads> filteredList = dataList;

    if(keyWord.isNotEmpty) {
      debugPrint("KeyWord is not empty");
      filteredList = dataList
          .where((item) =>
          (item.firstName.toString() + item.lastName.toString()).contains(
              keyWord))
          .toList();
    }else{
      debugPrint("KeyWord is empty");
    }

    emitSearchResult(filteredList);
  }

  void emitSearchResult(List<Leads> data) => emit(SearchFinished(data));

  void emitSearchLoading() => emit(SearchLoading());
}
