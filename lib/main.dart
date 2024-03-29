
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notary_public_flutter/controller/cubit/search_cubit.dart';
import 'package:notary_public_flutter/ui/screens/homescreen_screen/home_screen.dart';
import 'package:notary_public_flutter/utils/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/bloc/product_list_bloc/product_list_bloc.dart' as slb;
import 'controller/cubit/internet_cubit.dart';
import 'core/router/app_router.dart';
import 'data/repositories/product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    appRouter: AppRouter(),
    initialRoute: '/',
    connectivity: Connectivity(),
    key: null,
    productRepository: ProductRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  final ProductRepository productRepository;
  final String initialRoute;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
    required this.productRepository,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetCubitContext) =>
              InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<SearchCubit>(
          create: (searchCubitContext) =>
              SearchCubit(),
        ),
        BlocProvider<slb.ProductBloc>(
            create: (songBlocContext) => slb.ProductBloc(productRepository)),
      ],
      child: MaterialApp(
        title: 'Product Demo',
        //initialRoute: this.initialRoute,
        home: ProductListScreen(key: this.key),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
