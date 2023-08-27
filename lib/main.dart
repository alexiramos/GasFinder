import 'package:flutter/material.dart';
import 'package:gas_finder/Welcome.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:NextScreen()
    );
  }
}

class NextScreen extends StatefulWidget{

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen>{
  @override
  void initState(){
    super.initState();
    navigateToScreen(context);
  }
  Future<void> navigateToScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome()));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500), // Duración de la animación
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: Welcome(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
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
      );
  }

}