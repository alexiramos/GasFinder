import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: Scaffold(
        body: DrawerMenu(),
      ),
    );
  }
}

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MenuBar(_scaffoldKey),
          const SizedBox(height: 12,),
          Container(
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),

            ),
            constraints:const BoxConstraints(
              maxHeight: 200, // Altura máxima del Container
              minHeight: 200, // Altura mínima del Container
              maxWidth: 300,
            ),
          child: Image.asset("assets/Banner.png",),
          ),
          const SizedBox(height: 32,),
        ],
      ),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el cajón lateral
                  },
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 80,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Inicio",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 40,),
                  Text("Cerca de Mi ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  SizedBox(height: 40,),
                  Text("Ver Gasolineras ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  SizedBox(height: 40,),
                  Text("Precio Actual",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  SizedBox(height: 40,),
                  Text("Mi Perfil",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  SizedBox(height: 40,),
                  Text("Acerca de",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class MenuBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  String userName = "John Doe"; // Nombre de ejemplo

  MenuBar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Color de la sombra
                spreadRadius: 0.5, // Extensión de la sombra
                blurRadius: 6, // Desenfoque de la sombra
                offset: Offset(0, 4), // Desplazamiento de la sombra
              ),
            ],// Borde redondeado
          ),
          constraints: BoxConstraints(
            maxHeight: 70, // Altura máxima del Container
            minHeight: 70, // Altura mínima del Container
            maxWidth: 300,

          ),

          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenido',
                        style: TextStyle(fontSize: 18, ),
                      ),
                      Text(
                        userName,
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xffd22833)),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  TextButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                ],
              ),
        )
    );
  }
}