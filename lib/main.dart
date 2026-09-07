import 'package:flutter/material.dart';
import 'config/app_routes.dart';
import 'config/app_router.dart';

void main() {
  runApp(const VoraApp());
}

class VoraApp extends StatelessWidget {
  const VoraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VORA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: AppRoutes.onboarding,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
