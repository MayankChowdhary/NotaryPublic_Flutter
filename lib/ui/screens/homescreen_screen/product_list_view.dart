import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/models/product_model.dart';
import '../../../utils/constants/strings.dart';
import '../../widgets/dipslay_snackbar.dart';

class ProductListView extends StatelessWidget {
  ProductListView(this.model, {super.key});

  final List<Leads?> model;
  String quantity = "1";
  var encoder = new JsonEncoder.withIndent("     ");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: model?.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              displaySnackbar(context, "${model?[index]?.firstName} selected!")
            },
            child: Card(
              elevation: 3,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      height: 60,
                      width: 60,
                      imageUrl: Strings.iconUrl,
                      placeholder: (context, url) =>
                         Container(
                           margin: EdgeInsets.all(10),
                             child: CircularProgressIndicator()
                         ),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //Center Column contents vertically,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //Center Column contents horizontally,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "${model?[index]?.firstName} ${model?[index]?.lastName}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold))),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.0, bottom: 2.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${model?[index]?.email}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
