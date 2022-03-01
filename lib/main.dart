//A material design kell a fejlesztéshez.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webuni/screens/add_user.dart';
import 'package:webuni/screens/employee_list_page.dart';
import 'package:webuni/screens/user_details.dart';
import 'package:webuni/utils/user_repository.dart';

// Célszerű külön osztályban csinálni a widgeteket, még a főablakét is.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UserRepositoryProvider(
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Employee app',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: const Color.fromRGBO(176, 179, 191, 1),
              foregroundColor: Colors.black,
              titleTextStyle:
                  GoogleFonts.catamaran(fontSize: 24, color: Colors.black),
            ),
            iconTheme:
                const IconThemeData(color: Color.fromRGBO(42, 50, 75, 1)),
            textTheme: GoogleFonts.catamaranTextTheme(),
            scaffoldBackgroundColor: const Color.fromRGBO(199, 204, 219, 1),
            primarySwatch: Colors.red,
          ),
          home: const EmployeeListPage(),
          routes: {
            '/addUser': (context) => const AddUserPage(),
          },
          onGenerateRoute: (settings) {
            if (settings.name?.startsWith('/user/') ?? false) {
              var id = int.parse(settings.name!.split('/')[2]);
              var repository = UserRepository.of(context);
              var userList = repository.users;
              var user = userList.firstWhere((element) => element.id == id);
              return MaterialPageRoute(
                  builder: (context) => const UserDetailsPage(),
                  settings: settings.copyWith(arguments: user));
            }
            return null;
          },
        );
      }),
    );
  }
}
