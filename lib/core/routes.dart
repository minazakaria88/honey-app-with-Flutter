import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind/features/home/presentation/cubit/home_cubit.dart';
import 'package:mind/features/home/presentation/screens/all_products.dart';
import 'package:mind/features/home/presentation/screens/home_screen.dart';
import 'package:mind/features/login/presentation/cubit/login_cubit.dart';
import 'package:mind/features/login/presentation/screens/login_screen.dart';

import 'package:mind/injection.dart' as di;
class Routes {
  static const initRoute = '/';
  static const home = 'home';
  static const allProducts='allProducts';
}

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                  create: (context) => di.s1<LoginCubit>(),
                  child: const LoginScreen(),),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => di.s1<HomeCubit>()..getHomeData(),
              child: const HomeScreen()),
        );
      case Routes.allProducts:return MaterialPageRoute(
        builder: (context) =>  ProductsScreen(products: products,),
      );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
