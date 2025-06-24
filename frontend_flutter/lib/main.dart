import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appointment_manager_flutter/app.dart';

void main() {
  // runApp(const MyApp());
  // Wrap with ProviderScope for Riverpod
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
