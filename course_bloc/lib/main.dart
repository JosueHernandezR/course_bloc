import 'package:flutter/material.dart';
import 'package:course_bloc/config/config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: false).getTheme(),
      routerConfig: appRouter,
    );
  }
}
