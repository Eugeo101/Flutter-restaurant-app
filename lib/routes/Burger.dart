import 'package:flutter/material.dart';
import 'package:restaurant/Constants/DropItems.dart';
import 'package:restaurant/Constants/PopItems.dart';
import 'package:restaurant/Constants/Total.dart';
import 'package:restaurant/Constants/User.dart';
import 'package:restaurant/main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Cake.dart';
import 'CheckOut.dart';
import 'Drink.dart';
import 'Lunch.dart';

class Burger extends StatefulWidget {
  int? total;
  String? theme;
  Burger({required this.theme, required this.total, Key? key})
      : super(key: key);

  @override
  _BurgerState createState() => _BurgerState();
}

String firstTheme = 'LightTheme';
// List<int> arr = [99, 99, 99, 99, 99];
// List<int> userArr = [0, 0, 0, 0, 0];
// List<int> price = [30, 50, 60, 50, 30];
bool online = false;

class _BurgerState extends State<Burger> {
  @override
  void initState() {
    firstTheme = this.widget.theme!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int total = this.widget.total!;
    // total = total + amount(0);
    Total.burger = amount(0);
    int total = Total.burger! + Total.lunch! + Total.drink! + Total.cake!;
    // firstTheme = this.widget.theme!;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const spacer = Padding(padding: EdgeInsets.only(top: 5));
    const spacer2 = Padding(padding: EdgeInsets.all(3));
    const TextStyles = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.orange);
    const TextStyles2 = TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black);
    ////////////// DarkTheme ///////////////
    const TextStyles4 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black);
    const TextStyles17 = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.white);
    const TextStyles15 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black);
    const TextStyles5 = TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.white);
    const TextStyles3 = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black);
    const TextStyles6 = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.white);
    const TextStyles7 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.orange);
    const TextStyles8 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black);
    const TextStyles16 = TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.white);
      const TextStyles20 = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.white);
    const TextStyles11 = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black);
    const TextStyles12 = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.white);
    const TextStyles13 = TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        fontStyle: FontStyle.normal,
        color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            firstTheme == 'LightTheme' ? Colors.orange : Colors.black,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: firstTheme == 'LightTheme' ? Colors.black : Colors.white,),                        
            itemBuilder: (BuildContext context) {
              return PopItems.choices.map((element) {
                return PopupMenuItem(
                  child: Text(element, style: firstTheme == 'LightTheme' ? TextStyles4 : TextStyles15,),
                  value: element,
                );
              }).toList();
            },
            onSelected: (String choice) {
              if (choice == 'Burger') {
                //print('You Are At Burger Idiot');
              } else if (choice == 'Drink') {
                //print('Drink');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // //print(total);
                  return Drink(total: total, theme: firstTheme);
                }));
              } else if (choice == 'Cake') {
                //print('Cake');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // //print(total);
                  return Cake(total: total, theme: firstTheme);
                }));
              } else if (choice == 'Lunch') {
                //print('Lunch');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // //print(total);
                  return Lunch(
                  total: total,
                  theme: firstTheme);
                }));
              }
            },
          ),
        ],
        title: Text(
          "Ayman Rest",
          style: firstTheme == 'LightTheme' ? TextStyles13 : TextStyles16,
        ),
      ),

      ///////////////////////////////Body/////////////////////////////////
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: firstTheme == 'LightTheme' ? Colors.white: Colors.black)]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 35,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: firstTheme == 'LightTheme'?Colors.black: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: firstTheme == 'LightTheme'
                          ? [BoxShadow(color: Colors.orange)]
                          : [BoxShadow(color: Colors.white)],
                    ),
                    child: DropdownButton(
                        items: DropItems.Themes.map((theme) {
                          return DropdownMenuItem(
                            child: Text(theme),
                            value: theme,
                          );
                        }).toList(),
                        value: firstTheme,
                        onChanged: (String? theme) {
                          setState(() {
                            firstTheme = theme!;
                          });
                          // //print('107');
                        },
                        style: firstTheme == 'LightTheme'
                            ? TextStyles8
                            : TextStyles7),
                  ),
                ),
                spacer,
                Text(
                  "We Have Experience More Than 20 Years",
                  style: firstTheme == 'LightTheme' ? TextStyles7 : TextStyles20,
                ),
                spacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 4),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: firstTheme == 'LightTheme' ? Colors.black: Colors.blue)],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/tobey.png',
                              width: 180,
                              height: 120,
                            ),
                            spacer,
                            Text(
                              "Tobey Maguire Eatting From Ayman Rest - 2002",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles
                                  : TextStyles17,
                            ),
                          ],
                        ),
                      ),
                    ),
                    spacer2,
                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 4),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: firstTheme == 'LightTheme'? Colors.black:Colors.blue)],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/tomHolland.png',
                              width: 180,
                              height: 120,
                            ),
                            spacer,
                            Center(
                              child: Text(
                                "Tom Holland Eatting From Ayman Rest - 2019",
                                style: firstTheme == 'LightTheme'
                                    ? TextStyles
                                    : TextStyles17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                spacer,
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: firstTheme == 'LightTheme' ? Colors.black : Colors.white,style: BorderStyle.solid, width: 4)),
                    color:
                        firstTheme == 'LightTheme' ? Colors.orange : Colors.blue,
                    child: Row(children: [
                      spacer2,
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/Bacon.png'),
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[5] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      spacer2,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bacon King",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[5]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 30\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[5] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue)
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 25)),
                      Container(
                          child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  User.foodAmount[5]--;
                                  User.userArr[5]++;
                                });
                              },
                              child: Text("Order Now"),
                            ),
                          ),
                          spacer2,
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  if (User.foodAmount[5] == 99) {
                                  } else {
                                    User.foodAmount[5]++;
                                    User.userArr[5]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[5] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[5]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )
                              : spacer,
                          spacer,
                        ],
                      ))
                    ])),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: firstTheme == 'LightTheme' ? Colors.black : Colors.white,style: BorderStyle.solid, width: 4)),
                    color:
                        firstTheme == 'LightTheme' ? Colors.orange : Colors.blue,
                    child: Row(children: [
                      spacer2,
                      Column(
                        children: [
                          Image.asset(
                            'assets/tripler.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[6] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      spacer2,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Triple Whopper",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[6]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 50\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[6] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 17)),
                      Container(
                          child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  User.foodAmount[6]--;
                                  User.userArr[6]++;
                                });
                              },
                              child: Text("Order Now"),
                            ),
                          ),
                          spacer2,
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  if (User.foodAmount[6] == 99) {
                                  } else {
                                    User.foodAmount[6]++;
                                    User.userArr[6]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[6] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[6]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )
                              : spacer,
                          spacer,
                        ],
                      ))
                    ])),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: firstTheme == 'LightTheme' ? Colors.black : Colors.white,style: BorderStyle.solid, width: 4)),
                    color:
                        firstTheme == 'LightTheme' ? Colors.orange : Colors.blue,
                    child: Row(children: [
                      spacer2,
                      Column(
                        children: [
                          Image.asset(
                            'assets/Texas.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[7] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      spacer2,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Texas Whooper",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[7]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 60\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[7] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 15)),
                      Container(
                          child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  User.foodAmount[7]--;
                                  User.userArr[7]++;
                                });
                              },
                              child: Text("Order Now"),
                            ),
                          ),
                          spacer2,
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  if (User.foodAmount[7] == 99) {
                                  } else {
                                    User.foodAmount[7]++;
                                    User.userArr[7]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[7] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[7]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )
                              : spacer,
                          spacer,
                        ],
                      ))
                    ])),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: firstTheme == 'LightTheme' ? Colors.black : Colors.white,style: BorderStyle.solid, width: 4)),
                    color:
                        firstTheme == 'LightTheme' ? Colors.orange : Colors.blue,
                    child: Row(children: [
                      spacer2,
                      Column(
                        children: [
                          Image.asset(
                            'assets/DoubleBurger.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[8] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      spacer2,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Chesse Burger",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[8]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 50\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[8] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Container(
                          child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  User.foodAmount[8]--;
                                  User.userArr[8]++;
                                });
                              },
                              child: Text("Order Now"),
                            ),
                          ),
                          spacer2,
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  if (User.foodAmount[8] == 99) {
                                  } else {
                                    User.foodAmount[8]++;
                                    User.userArr[8]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[8] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[8]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )
                              : spacer,
                          spacer,
                        ],
                      ))
                    ])),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: firstTheme == 'LightTheme' ? Colors.black : Colors.white,style: BorderStyle.solid, width: 4)),
                    color:
                        firstTheme == 'LightTheme' ? Colors.orange : Colors.blue,
                    child: Row(children: [
                      spacer2,
                      Column(
                        children: [
                          Image.asset(
                            'assets/Whooper.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[9] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      spacer2,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Whooper",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[9]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 30\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[9] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 25)),
                      Container(
                          child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  User.foodAmount[9]--;
                                  User.userArr[9]++;
                                });
                              },
                              child: Text("Order Now"),
                            ),
                          ),
                          spacer2,
                          SizedBox(
                            width: 130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  if (User.foodAmount[9] == 99) {
                                  } else {
                                    User.foodAmount[9]++;
                                    User.userArr[9]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[9] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[9]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )
                              : spacer,
                          spacer,
                        ],
                      ))
                    ])),
                spacer,
                total != 0
                    ? Container(
                        width: width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: firstTheme == 'LightTheme'? Colors.black:Colors.white),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: firstTheme == 'LightTheme'
                                ? [BoxShadow(color: Colors.orange)]
                                : [BoxShadow(color: Colors.blue)]),
                        // height: height,
                        child: Center(
                            child: Column(
                          children: [
                            Text(
                              "Total Price is: ${total}\$",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5,
                            ),
                            TextButton(
                                onPressed: () {
                                  // //print('Go to Checkout');
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CheckOut(total: total);
                                  }));
                                },
                                child: Text(
                                  "Go to CheckOut!",
                                  style: TextStyle(color: firstTheme == 'LightTheme'
                                  ? Colors.blue: Colors.orangeAccent),
                                ))
                          ],
                        )),
                      )
                    : Container(
                        width: width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: firstTheme == 'LightTheme'? Colors.black:Colors.white),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: firstTheme == 'LightTheme'
                                ? [BoxShadow(color: Colors.orange)]
                                : [BoxShadow(color: Colors.blue)]),
                        // height: height,
                        child: Center(
                            child: Text(
                          "You didn't order anything yet!!",
                          style: firstTheme == 'LightTheme'
                              ? TextStyles2
                              : TextStyles5,
                        )),
                      ),
              ],
            ),
          ),
        ),
      ),

      //////////////////////////////////////////////////////drawer//////////////////////////////////////////////////////
      drawer: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.orange.shade300)]),
        child: Drawer(
            child: Container(
          color: firstTheme == 'LightTheme' ? Colors.yellow : Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacer,
                    spacer,
                    Center(
                      child: Text(
                        "Ayman Rest",
                        style: firstTheme == 'LightTheme' ?TextStyles11:TextStyles12,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 60)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Opening 24 hours daily",
                        style: firstTheme == 'LightTheme' ?TextStyles3:TextStyles6,
                      ),
                    ),
                    spacer,
                    spacer,
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "+02 262 49 653",
                        style: firstTheme == 'LightTheme' ?TextStyles3:TextStyles6,
                      ),
                    ),
                    spacer,
                    spacer,
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "20 Ingram Street at New York City",
                        style: firstTheme == 'LightTheme' ?TextStyles3:TextStyles6,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 70)),
                    Image(image: AssetImage('assets/drawer.png')),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Delicouse Ramen is Waiting for you",
                            style: TextStyle(
                              color: firstTheme == 'LightTheme'? Colors.black: Colors.white,
                              fontFamily: 'Arial',
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "ONLY for 40\$",
                            style: TextStyle(
                              color: firstTheme == 'LightTheme'? Colors.black: Colors.white,
                              fontFamily: 'Arial',
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 250)),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              tooltip: "Contact us on Facebook",
                              color: Colors.white,
                              onPressed: () {
                                customeLaunch(
                                    'https://www.facebook.com/profile.php?id=100012323822489');
                              },
                              iconSize: 30,
                              icon: Icon(
                                Icons.facebook,
                                color: firstTheme == 'LightTheme'? Colors.blue:Colors.white,
                              ),
                            ),
                            IconButton(
                              tooltip: "Call us",
                              color: Colors.white,
                              onPressed: () {},
                              iconSize: 30,
                              icon: Icon(
                                Icons.call,
                                color: firstTheme == 'LightTheme'? Colors.blue:Colors.white,
                              ),
                            ),
                            IconButton(
                              tooltip: "Mail Us",
                              color: Colors.white,
                              onPressed: () {},
                              iconSize: 30,
                              icon: Icon(
                                Icons.email,
                                color: firstTheme == 'LightTheme'? Colors.blue:Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ]),
            ),
          ),
        )),
      ),
    );
  }

  int amount(int total) {
    int sum = total;
    for (int i = 5; i < 10; i++) {
      sum = sum + User.userArr[i] * User.foodPrice[i];
    }
    return sum;
  }

  void customeLaunch(String s) async {
    if (await canLaunch(s)) {
      await launch(s);
    } else {
      print('can' 't run');
    }
  }
}
