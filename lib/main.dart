import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Splash.dart';
import 'package:page_transition/page_transition.dart';

// import 'package:restaurant/Constants/PopItems.dart';

// import 'Constants/DropItems.dart';
// import 'routes/Burger.dart';
// import 'routes/Cake.dart';
// import 'routes/Drink.dart';
import 'routes/Lunch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange),
      home: AnimatedSplashScreen(
        splashIconSize: 130,
        animationDuration: Duration(milliseconds: 1500),
        duration: 2000,
        backgroundColor: Color(0xFFFFDE59),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        splash: Image(
          image: AssetImage('assets/ResturantPlease.png')),
        nextScreen: Restaurant()),
    );
  }
}


class Restaurant extends StatelessWidget {
  const Restaurant({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ayman Rest", style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black),
        ),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome To Ayman Restaurant', style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.orange),),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text('The World''s Best Restaurant In 2021', style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.orange),),
              Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: Colors.black
                ),
                borderRadius: BorderRadius.circular(15),
                // boxShadow: [BoxShadow(color: Colors.)]
              ),
              child: Image(image: AssetImage('assets/tobey.png'))),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              width: 120,
              child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Lunch(theme: 'LightTheme', total: 0,);
                }));
              },
              child: Text("Go To Menu", style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black)
        ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    width: 4,
                  ),
                )
              ),
        ),
            ),

          ],
        ),
      ),
    );
  }
}

