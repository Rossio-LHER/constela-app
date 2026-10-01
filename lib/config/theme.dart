import 'package:flutter/material.dart';

/// Tema global de CONSTELA con colores gamificados
final ThemeData constelaTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  
  // Colores primarios basados en razas
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF7C3AED), // Púrpura (Astrales)
    secondary: const Color(0xFFEC4899), // Rosa (Célidos)
    tertiary: const Color(0xFF0EA5E9), // Cyan (Nebulanos)
    background: const Color(0xFF0F172A),
    surface: const Color(0xFF1E293B),
    error: const Color(0xFFEF4444),
  ),
  
  // AppBar
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0F172A),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  
  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF7C3AED),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
    ),
  ),
  
  // Text Theme
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Color(0xFFE2E8F0),
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFFCBD5E1),
      fontSize: 14,
    ),
  ),
  
  // Input Decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E293B),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF475569)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF475569)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF7C3AED), width: 2),
    ),
    hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
  ),
  
  // Bottom Navigation
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1E293B),
    selectedItemColor: Color(0xFF7C3AED),
    unselectedItemColor: Color(0xFF64748B),
    elevation: 8,
  ),
);

/// Paleta de colores por raza
class ColorsPorRaza {
  static const Color astrales = Color(0xFF7C3AED); // Púrpura
  static const Color celidos = Color(0xFFEC4899); // Rosa
  static const Color nebulanos = Color(0xFF0EA5E9); // Cyan
}

/// Paleta de colores por rareza de skin
class ColorsPorRareza {
  static const Color basico = Color(0xFF64748B); // Gris
  static const Color epico = Color(0xFFA855F7); // Púrpura
  static const Color collector = Color(0xFFFFD700); // Oro
}
