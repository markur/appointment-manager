import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Placeholder for actual screen widgets
// import 'package:appointment_manager_flutter/features/auth/presentation/login_screen.dart';
// import 'package:appointment_manager_flutter/features/time_tracking/presentation/home_screen.dart';
// import 'package:appointment_manager_flutter/features/time_tracking/presentation/job_list_screen.dart';

// Simple placeholder screen
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Screen: $title')),
    );
  }
}


final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash', // Or '/login' or '/home' depending on auth state
    debugLogDiagnostics: true, // Enable for debugging
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const PlaceholderScreen(title: 'Splash Screen'),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const PlaceholderScreen(title: 'Login Screen'), // Replace with actual LoginScreen
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const PlaceholderScreen(title: 'Home Screen'), // Replace with actual HomeScreen
        routes: [
          GoRoute(
            path: 'jobs', // Example: /home/jobs
            builder: (context, state) => const PlaceholderScreen(title: 'Job List Screen'), // Replace with actual JobListScreen
          ),
        ],
      ),
      // Add more routes for clients, appointments, settings etc.
    ],
    // Optional: redirect logic based on auth state
    // redirect: (BuildContext context, GoRouterState state) {
    //   final bool loggedIn = ref.watch(authNotifierProvider).isLoggedIn; // Example auth state
    //   final bool loggingIn = state.matchedLocation == '/login';
    //
    //   if (!loggedIn && !loggingIn) return '/login';
    //   if (loggedIn && loggingIn) return '/home';
    //
    //   return null; // No redirect
    // },
  );
});
