import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/logo.png'),width: 250,height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Gas',
                  style: GoogleFonts.koulen(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: const Color(0xff3e4c6b)
                  )
                ),
                Text('Finder',
                    style: GoogleFonts.koulen(
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                        color:const Color(0xffd22833)
                    )
                )
              ],)
            ],
          )
        ),
      ),
    );
  }
}
