import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notary_public_flutter/controller/cubit/search_cubit.dart';

import '../../data/models/product_model.dart';

class SearchBarApp extends StatefulWidget {
  final List<Leads> hintList;

  const SearchBarApp(this.hintList, {super.key});

  @override
  State<SearchBarApp> createState() => SearchBox(hintList);
}

class SearchBox extends State<SearchBarApp> {
  final List<Leads> hintList;

  SearchBox(this.hintList);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (value) {
              controller.openView();
            },
            onSubmitted: (value) {
              controller.closeView(value);
            },
            leading: const Icon(Icons.search),
          );
        }, suggestionsBuilder:
                (BuildContext context, SearchController controller) {
                  BlocProvider.of<SearchCubit>(context)
                      .startSearch(controller.text, hintList);
          return List<Widget>.generate(hintList.length, (int index) {
            final String item = (hintList[index].firstName).toString() +
                (hintList[index].lastName).toString();
            if (item.toLowerCase().contains(controller.text.toLowerCase())) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    BlocProvider.of<SearchCubit>(context)
                        .startSearch(item, hintList);
                    controller.closeView(item);
                  });
                },
              );
            } else {
              return SizedBox();
            }
          });
        }));
  }
}
