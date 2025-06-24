import 'package:appointment_manager_flutter/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Appointment Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: goRouter,
      // home: const MyHomePage(title: 'Appointment Manager Home'), // Replaced by router
    );
  }
}

// Placeholder for initial screen (will be replaced by router's initial route)
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: const Center(
//         child: Text(
//           'Welcome to Appointment Manager (Flutter)!',
//         ),
//       ),
//     );
//   }
// }
