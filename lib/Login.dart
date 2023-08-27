import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.senTextTheme(), // Carga la fuente Lato desde Google Fonts
      ),
      home: Scaffold(
        resizeToAvoidBottomInset:false,
        body:Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Color(0xff44587e),
                    Color(0xff3e4c6b),
                    Color(0xff303b52)
                  ]
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 140,),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text("Bienvenido",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Por favor ingresa con tu cuenta existente",style: TextStyle(color: Colors.white,fontSize: 15,),)
                      ],
                    ) ,
                ),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                      ),
                      child: Padding(

                        padding: EdgeInsets.all(20),
                        child:Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Cambia el color del borde inferior
                              ),
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(height: 40,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Cambia el color del borde inferior
                              ),
                              prefixIcon: Icon(Icons.remove_red_eye),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: false, // Cambia este valor según tu lógica
                                onChanged: (bool? newValue) {
                                  // Cambia el valor según tu lógica
                                },
                              ),
                              Text(
                                'Recordarme',
                                style: TextStyle(fontSize: 14),
                              ),
                              Spacer(), // Agrega espacio flexible
                              TextButton(
                                onPressed: () {
                                  // Lógica para el enlace de texto "Ya tienes cuenta ? Registrarme ahora"
                                },
                                child: Text(
                                  'Olvide mi contraseña',
                                  style: TextStyle(
                                    color: Color(0xffeebd3d),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          ElevatedButton(

                            onPressed: () {
                              // Lógica para el botón "Ingresar"
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffeebd3d), // Cambia el color del botón
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              minimumSize: Size(double.infinity, 50), // Hace que el botón tenga un ancho máximo y una altura fija
                            ),
                            child: Text('Ingresar'),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              // Lógica para el enlace de texto "Ya tienes cuenta ? Registrarme ahora"
                            },
                            child: Text(
                              'Ya tienes cuenta ? Registrarme ahora',
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                         ]
                      ),)
                    )
                )
                ],
            )
            ,
          )
      ),
    );
  }
}


