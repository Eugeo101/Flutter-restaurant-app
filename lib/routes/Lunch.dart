import 'package:flutter/material.dart';
import 'package:restaurant/Constants/PopItems.dart';
import 'package:restaurant/Constants/DropItems.dart';
import 'package:restaurant/Constants/Total.dart';
import 'package:restaurant/Constants/User.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Burger.dart';
import 'Cake.dart';
import 'CheckOut.dart';
import 'Drink.dart';

class Lunch extends StatefulWidget {
  int? total;
  String? theme;
  Lunch({required this.theme, required this.total, Key? key}) : super(key: key);

  @override
  _LunchState createState() => _LunchState();
}

String firstTheme = 'LightTheme';
// List<int> arr = [99, 99, 99, 99, 99];
// List<int> userArr = [4, 0, 0, 0, 0];
// List<int> price = [40, 50, 60, 100, 45];

/*order
  setState(){
    if (arr[0] == 0){
      //code remove widget
    }
    else{
      userArr[0]++;
      arr[0]--;
    }

  }
*/

/*remove
  setState(){
    if (arr[0] == 99){

    }
    else {
      userArr[0]--;
      arr[0]++;
    }
  }
*/

// int counter = 0;
// int total = 0;

class _LunchState extends State<Lunch> {
  @override
  void initState() {
    firstTheme = this.widget.theme!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int total = this.widget.total!;
    // total = total + amount(0);
    Total.lunch = amount(0);
    int total = Total.burger! + Total.lunch! + Total.drink! + Total.cake!;
    // if (counter == 1) {
    //   //print(counter);
    // }
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
                //print('Burger');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // //print(total);
                  return Burger(total: total, theme: firstTheme);
                }));
              } else if (choice == 'Drink') {
                //print('Drink');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // //print(total);
                  return Cake(total: total, theme: firstTheme);
                }));
              } else if (choice == 'Cake') {
                //print('Cake');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // //print(total);
                  return Drink(total: total, theme: firstTheme);
                }));
              } else if (choice == 'Lunch') {
                //print('You Are At Home Idiot');
              }
            },
          ),
        ],
        title: Text(
          "Ayman Rest",
          style: firstTheme == 'LightTheme' ? TextStyles13 : TextStyles16,
        ),
      ),

      //////////////////////////////////////////////////Body/////////////////////////////////////////////////////////////////////////////////
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
                            image: AssetImage('assets/imageName5.png'),
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[0] != 0
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
                          Text("Indian Food",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[0]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 40\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[0] != 0
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
                                  User.foodAmount[0]--;
                                  User.userArr[0]++;
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
                                  if (User.foodAmount[0] == 99) {
                                  } else {
                                    User.foodAmount[0]++;
                                    User.userArr[0]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[0] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[0]}',
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
                            'assets/imageName2.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[1] != 0
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
                          Text("Lasagna",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[1]}",
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
                          User.userArr[1] != 0
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
                                  User.foodAmount[1]--;
                                  User.userArr[1]++;
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
                                  if (User.foodAmount[1] == 99) {
                                  } else {
                                    User.foodAmount[1]++;
                                    User.userArr[1]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[1] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[1]}',
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
                            'assets/imageName3.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[2] != 0
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
                          Text("Ayman Pizza",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[2]}",
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
                          User.userArr[2] != 0
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
                                  User.foodAmount[2]--;
                                  User.userArr[2]++;
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
                                  if (User.foodAmount[2] == 99) {
                                  } else {
                                    User.foodAmount[2]++;
                                    User.userArr[2]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[2] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[2]}',
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
                            'assets/imageName6.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[3] != 0
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
                          Text("Colorado Springs",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[3]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 100\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[3] != 0
                              ? Padding(padding: EdgeInsets.only(top: 17))
                              : Container(
                                  color: firstTheme == 'LightTheme'
                                      ? Colors.orange
                                      : Colors.blue),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 4)),
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
                                  User.foodAmount[3]--;
                                  User.userArr[3]++;
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
                                  if (User.foodAmount[3] == 99) {
                                  } else {
                                    User.foodAmount[3]++;
                                    User.userArr[3]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[3] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[3]}',
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
                            'assets/drawer.png',
                            width: 120,
                            height: 100,
                          ),
                          User.userArr[4] != 0
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
                          Text("Ramen",
                              style: firstTheme == 'LightTheme'
                                  ? TextStyles2
                                  : TextStyles5),
                          spacer,
                          Text(
                            "Amount is: ${User.foodAmount[4]}",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          spacer,
                          Text(
                            "Price is: 45\$",
                            style: firstTheme == 'LightTheme'
                                ? TextStyles2
                                : TextStyles5,
                          ),
                          User.userArr[4] != 0
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
                                  User.foodAmount[4]--;
                                  User.userArr[4]++;
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
                                  if (User.foodAmount[4] == 99) {
                                  } else {
                                    User.foodAmount[4]++;
                                    User.userArr[4]--;
                                  }
                                });
                              },
                              child: Text("Remove Order"),
                            ),
                          ),
                          spacer,
                          User.userArr[4] != 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(color: Colors.white)],
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('${User.userArr[4]}',
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
                                customeLanch(
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

  int amount(int summation) {
    // if (summation == Null) {
    //   return 0;
    // }
    int sum = summation;
    for (int i = 0; i < 5; i++) {
      sum = sum + User.userArr[i] * User.foodPrice[i];
    }
    return sum;
  }

  void customeLanch(String s) async {
    if (await canLaunch(s)) {
      await launch(s);
    } else {
      print('Can' 't run');
    }
  }
}
