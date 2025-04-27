// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unieatsappv0/providers/cart_provider.dart';
import 'package:unieatsappv0/screens/dashboard_screen.dart';
import 'package:unieatsappv0/screens/cart_screen.dart';
import 'package:unieatsappv0/screens/search_screen.dart';
import 'package:unieatsappv0/screens/profile_screen.dart';
import 'package:unieatsappv0/screens/cafeteria_screen.dart';
import 'package:unieatsappv0/screens/splash_screen.dart';
import 'package:unieatsappv0/widgets/bottom_navigation.dart';
import 'package:unieatsappv0/models/cafeteria.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'UniEats',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        //home: const BottomNavigation(currentIndex: 0),
        home: SplashScreen(),
        routes: {
          '/dashboard': (ctx) => const DashboardScreen(),
          '/search': (ctx) => const SearchScreen(),
          '/cart': (ctx) => const CartScreen(), // Make sure this is CartScreen, not CartPage
          '/profile': (ctx) => const ProfileScreen(),
          '/checkout': (ctx) => const Scaffold(
            body: Center(child: Text('Checkout Page')),
          ),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/cafeteria') {
            final args = settings.arguments as Map<String, dynamic>?;
            if (args == null) {
              return MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(child: Text('Cafeteria not found')),
                ),
              );
            }
            return MaterialPageRoute(
              builder: (context) => CafeteriaScreen(
                cafeteriaId: args['id'] as String,
                cafeteria: args['cafeteria'] as Cafeteria?,
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
