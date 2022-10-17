import 'package:flutter/material.dart';
import 'package:restaurant/main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0xFFFFDE59))]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ayman Rest', style: TextStyle(
                fontSize: 16,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),),
              ClipOval(
                child: Image(
                  width: 80,
                  height: 50,
                  image: AssetImage('assets/ResturantPlease.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Restaurant();
    }));
  }
}
