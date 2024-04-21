import 'package:flutter/material.dart';
import 'package:mind/core/routes.dart';
import 'package:mind/injection.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const Mind());
}

class Mind extends StatelessWidget {
  const Mind({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

