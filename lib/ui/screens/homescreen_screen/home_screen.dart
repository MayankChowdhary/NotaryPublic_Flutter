import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/internet_cubit.dart';
import '../../../data/models/flunkey_model.dart';
import '../../../utils/constants/strings.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/message_dialog.dart';
import '../../widgets/message_view.dart';
import '../../../controller/bloc/flunkey_list_bloc/flunkey_list_bloc.dart'
    as slb;
import '../../widgets/navigation_drawer.dart';
import 'flunkey_list_view.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = Strings.homeScreenRoute;

  ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductListScreen> {
  String? _value = 'ALL';
  List<DropdownMenuItem<String>> menuItems = [
    new DropdownMenuItem(
      child: new Text("All Category"),
      value: "ALL",
    )
  ];

  void addDropDownItems(List<Leads> model) {
    menuItems.clear();
    menuItems.add(new DropdownMenuItem(
      child: new Text("All Category"),
      value: "ALL",
    ));
    List<String> catItems = [];
    model.forEach((element) {
      catItems.add(element.firstName.toString());
    });
    var distinctCat = catItems.toSet().toList();
    distinctCat.forEach((element) {
      menuItems.add(new DropdownMenuItem(
        child: new Text(element),
        value: element,
      ));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String trackId  = args.arg1!;*/

    BlocProvider.of<slb.SongBloc>(context).add(slb.LoadSongListEvent());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Text(
              "Notary Public",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: new Theme(
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _value,
                    items: menuItems,
                    onChanged: (String? value) {
                      setState(() => _value = value);
                    },
                  ),
                ),
                data: new ThemeData.dark(),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: getNavigationDrawer(context),
      ),
      body:
          BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
        if (state is InternetConnected) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<slb.SongBloc, slb.SongListState>(
                  builder: (context, state) {
                    if (state is slb.SongLoadingState) {
                      return loadingWidget();
                    } else if (state is slb.SongLoadedState) {
                      addDropDownItems(state.items);
                      List<Leads> filteredList = [];
                      if (_value == "ALL") {
                        filteredList = state.items;
                      } else {
                        filteredList = state.items
                            .where((i) => i.firstName == _value)
                            .toList();
                      }
                      return ProductListView(filteredList);
                    } else if (state is slb.SongErrorState) {
                      return showMessageView(message: "Loading Products...");
                    } else {
                      return showMessageView(message: "Loading Products...");
                    }
                  },
                ),
              ],
            ),
          );
        } else if (state is InternetDisconnected) {
          return showMessageView(message: "No Internet Available");
        } else {
          return showMessageView(message: "Loading Products...");
        }
      }),
    );
  }
}
