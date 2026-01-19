// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/invoice_form_screen.dart';

/// App entry point
void main() {
  // ProviderScope is required at the root for Riverpod to work
  // It stores all provider states and manages their lifecycle
  runApp(const ProviderScope(child: MyApp()));
}

/// Root application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App metadata
      title: 'PDF Invoice Generator',
      debugShowCheckedModeBanner: false,

      // Theme configuration for consistent styling
      theme: ThemeData(
        // Primary color scheme
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 34, 104, 82),
          brightness: Brightness.light,
        ),

        useMaterial3: true,

        // AppBar theme
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.white,
        ),

        // Input decoration theme for text fields
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),

        // Elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      // Home screen
      home: const InvoiceFormScreen(),
    );
  }
}
