import 'package:calcbmi/Elements/output_page.dart';
import 'package:flutter/material.dart';
import 'Elements/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF0A0E21),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF0A0E21),
          )),
      /*theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF0A0E21),
          background: Color(0xFF0A0E21),
          brightness: Brightness.dark,
          secondary: Colors.purple,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.deepPurple,
          onError: Colors.white,
          onBackground: Colors.white,
          surface: Color(0xFF0A0E21),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),*/
      home: InputPage(),
      /*
      initialRoute: '/input',
      routes: {
        '/input' : (context)=>InputPage(),
        '/output' : (context)=>output_page(bmivar),
      },
      */
    );
  }
}


