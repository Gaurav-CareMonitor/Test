import 'package:clinician/core/theme/theme.dart';
import 'package:clinician/features/auth/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareMonitor Clinician',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.primary(context),
      home: const WelcomeScreen(),
    );
  }
}
