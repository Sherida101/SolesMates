import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solesmates/routes/routes.dart';
import 'package:solesmates/screens/account_screen.dart';
import 'package:solesmates/screens/cart/cart_screen.dart';
import 'package:solesmates/screens/home/mainhome_screen.dart';
import 'package:solesmates/screens/home_screen.dart';
import 'package:solesmates/screens/orders/orders_screen.dart';
import 'package:solesmates/screens/search_screen.dart';
import 'package:solesmates/screens/welcome_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final Map<String, dynamic> arguments = settings.arguments;
  switch (settings.name) {
    case accountScreenRoute:
      return PageTransition(
        child: const AccountScreen(),
        type: PageTransitionType.fade,
      );

    case cartScreenRoute:
      return PageTransition(
        child: const CartScreen(),
        type: PageTransitionType.fade,
      );

    case homeScreenRoute:
      return PageTransition(
        child: const HomeScreen(),
        type: PageTransitionType.fade,
      );

    case mainScreenRoute:
      return PageTransition(
        child: const MainHomeScreen(),
        type: PageTransitionType.fade,
      );

    case ordersScreenRoute:
      return PageTransition(
        child: const OrdersScreen(),
        type: PageTransitionType.fade,
      );

    case searchScreenRoute:
      return PageTransition(
        child: const SearchScreen(),
        type: PageTransitionType.fade,
      );

    case welcomeScreenRoute:
      return PageTransition(
        child: const WelcomeScreen(),
        type: PageTransitionType.fade,
      );

    default:
      return PageTransition(
        child: const WelcomeScreen(),
        type: PageTransitionType.fade,
      );
  }
}
