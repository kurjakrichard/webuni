//A material design kell a fejlesztéshez.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webuni/screens/employee_list_page.dart';
import 'package:webuni/utils/user_repository.dart';

// Célszerű külön osztályban csinálni a widgeteket, még a főablakét is.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UserRepositoryProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employee app',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: const Color.fromRGBO(176, 179, 191, 1),
            foregroundColor: Colors.black,
            titleTextStyle:
                GoogleFonts.catamaran(fontSize: 24, color: Colors.black),
          ),
          textTheme: GoogleFonts.catamaranTextTheme(),
          scaffoldBackgroundColor: const Color.fromRGBO(199, 204, 219, 1),
          primarySwatch: Colors.red,
        ),
        home: const EmployeeListPage(),
      ),
    );
  }
}
