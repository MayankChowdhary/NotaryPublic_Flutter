import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notary_public_flutter/controller/cubit/search_cubit.dart';

import '../../../controller/bloc/product_list_bloc/product_list_bloc.dart' as slb;
import '../../../controller/cubit/internet_cubit.dart';
import '../../../data/models/product_model.dart';
import '../../../utils/constants/strings.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/message_dialog.dart';
import '../../widgets/message_view.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_widget.dart';
import 'product_list_view.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = Strings.homeScreenRoute;

  ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String trackId  = args.arg1!;*/

    BlocProvider.of<slb.ProductBloc>(context).add(slb.LoadProductListEvent());

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
                BlocBuilder<slb.ProductBloc, slb.ProductListState>(
                  builder: (context, state) {
                    if (state is slb.ProductLoadingState) {
                      return loadingWidget();
                    } else if (state is slb.ProductLoadedState) {
                      List<Leads> filteredList = state.items;
                      return BlocBuilder<SearchCubit, SearchState>(
                          builder: (context, searchState) {
                        if ((searchState is SearchFinished) &&
                            searchState.searchData.isNotEmpty) {
                          filteredList = searchState.searchData;
                        } else {
                          filteredList = state.items;
                        }
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SearchBarApp(filteredList),
                              SizedBox(height: 20),
                              ProductListView(filteredList),
                            ],
                          ),
                        );
                      });
                    } else if (state is slb.ProductErrorState) {
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
