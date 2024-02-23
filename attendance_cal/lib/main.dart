import 'package:attendance_cal/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

final kcolorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light, seedColor: Color.fromARGB(255, 143, 0, 252));
final kdarkcolorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 143, 0, 252));

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kcolorScheme,
          scaffoldBackgroundColor: kcolorScheme.secondary,
          appBarTheme: AppBarTheme(
            color: kcolorScheme.primary,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), gapPadding: 100),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                splashFactory: InkSparkle.splashFactory,
                foregroundColor:
                    MaterialStatePropertyAll(kcolorScheme.primary)),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
              iconColor: MaterialStatePropertyAll(kcolorScheme.primary),
            ),
          ),
          textTheme: GoogleFonts.meriendaTextTheme(),
        ),
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          colorScheme: kcolorScheme,
          scaffoldBackgroundColor: kcolorScheme.secondary,
          appBarTheme: AppBarTheme(
            color: kcolorScheme.primary,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                gapPadding: 100,
                borderSide: const BorderSide()),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                splashFactory: InkSparkle.splashFactory,
                foregroundColor:
                    MaterialStatePropertyAll(kcolorScheme.primary)),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
              iconColor: MaterialStatePropertyAll(kcolorScheme.primary),
            ),
          ),
          textTheme: GoogleFonts.meriendaTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
