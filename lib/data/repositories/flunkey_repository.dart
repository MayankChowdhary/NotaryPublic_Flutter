import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants/strings.dart';
import '../models/flunkey_model.dart';

class ProductRepository {
  final queryParameters = {
  'notaryId': '643074200605c500112e0902'
  };

  Future<ProductModel> getProducts() async {
    Uri uri = Uri.parse(Strings.dataUrl);
    debugPrint(uri.toString());
    final response = await http.post(uri,body: queryParameters);
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return productModelFromJson(response.body);
    } else {
      debugPrint("Failed to load Songs");
      throw Exception("Failed to load songs");
    }
  }
}
