import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gas_finder/Login.dart';
import 'package:carousel_slider/carousel_slider.dart'; //Para carrusel de imagenes


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.senTextTheme(), // Carga la fuente Lato desde Google Fonts
      ),
      home: MyCarousel(),
    );
  }
}

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final List<Map<String, String?>> slides = [
    {
      'image': 'assets/welcome/map.png',
      'title': 'Lorem Ipsum',
      'description': 'Lorem Ipsum Dolor',
    },
    {
      'image': 'assets/welcome/money.png',
      'title': 'Lorem Ipsum2',
      'description': 'Lorem Ipsum Dolor',
    },
    {
      'image': 'assets/welcome/rating.png',
      'title': 'Lorem Ipsum3',
      'description': 'Lorem Ipsum Dolor',
    },
  ];
  //Para el movimiento del carrusel
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  void _goToNextPage() {

    if (_currentIndex+1 == slides.length){
      navigateToScreen(context);
    }
    _carouselController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void navigateToScreen(BuildContext context)  {
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome()));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Login(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CarouselSlider.builder(
            itemCount: slides.length,
            carouselController: _carouselController,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image(
                      image: AssetImage(slides[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    slides[index]['title']!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(slides[index]['description']!),
                ],
              );
            },
            options: CarouselOptions(
              height: 400.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              autoPlay: false,
              viewportFraction: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides.map((slide) {
              int index = slides.indexOf(slide);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Color(0xffd22833) : Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  backgroundColor: Color(0xffeebd3d), // Color de fondo del botón
                ),
                onPressed: () {
                  _goToNextPage();
                },
                child: Text('Siguiente',style:TextStyle(fontSize: 20)),
              ),
              TextButton(
                onPressed: () {
                  // Acción para omitir
                  navigateToScreen(context);
                },
                child: Text('Omitir',style: TextStyle(color: Colors.grey),),
              ),

            ],
          ),
        ],
      )
      )
    );
  }
}