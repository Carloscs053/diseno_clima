import 'package:flutter/material.dart';
import 'package:segundo_diseno/config/router/app_router.dart';
import 'package:segundo_diseno/providers/tiempo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TiempoProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Segundo Diseño',
        routerConfig: appRouter,
      ),
    );
  }
}
