import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wegostudy/mvvm/token_view_model.dart';
import 'package:wegostudy/page/login_page.dart';
import 'package:wegostudy/page/login_success_page.dart';
import 'package:wegostudy/page/register_page.dart';
import 'package:wegostudy/page/start_page.dart';
import 'package:wegostudy/model/token.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TokenViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StartPage(),
        initialRoute: '/',
        routes: {
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/login_success': (context) => LoginSuccessPage(),
        },
      ),
    );
  }
}
