import 'package:flutter/material.dart';
import 'package:restaurant/Constants/Total.dart';
import 'package:restaurant/Constants/User.dart';
import 'package:restaurant/routes/Lunch.dart';

import '../main.dart';

class CheckOut extends StatelessWidget {
  int? total;
  CheckOut({required this.total, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayman Rest Checkout",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
                fontStyle: FontStyle.normal,
                color: Colors.black)),
      ),
      body: this.total! == 0
          ? Center(
              child: Column(
                children: [
                  Text("Please Buy anything First"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          return Lunch(theme: "LightTheme", total: 0);
                        }), (Route<dynamic> route) => false);
                      },
                      child: Text("Back To Lunch Menu"))
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('you will pay ${this.total!}\$ are you sure?'),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              for (int i = 0; i < User.userArr.length; i++) {
                                User.userArr[i] = 0;
                              }
                              for (int i = 0; i < User.foodAmount.length; i++) {
                                User.foodAmount[i] = 99;
                              }
                              Total.lunch = 0;
                              Total.drink = 0;
                              Total.burger = 0;
                              Total.cake = 0;
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return Restaurant();
                              }), (route) => false);
                            },
                            child: Text("Sure")),
                      ),
                      Padding(padding: EdgeInsets.only(left: 30)),
                      SizedBox(
                        width: 130,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
