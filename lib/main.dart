import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var tween =
      Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.ease));
  AnimationController animationController;

  PageController controller = PageController(viewportFraction: 0.7);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
    var val = Timer.periodic(Duration(seconds: 1), (timer){
      controller.animateToPage(controller.page.toInt()+1, duration: Duration(seconds: 1), curve: Curves.ease);
    });
    controller.addListener((){
      if(controller.page.toInt()==15){
        val.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg2.jpg"),
                  fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: Icon(
                      Icons.settings,
                      color: Colors.grey[700],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        RotationTransition(
                          turns: tween.animate(animationController),
                          child: Container(
                            child: Icon(
                              Icons.wb_sunny,
                              color: Colors.grey[200],
                              size: 140,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 10),
                            child: RichText(
                              text: TextSpan(
                                  text: "Good Afternoon,",
                                  children: [
                                    TextSpan(
                                        text: "\nJosteve",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.black))
                                  ],
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.grey[600],
                                      fontStyle: FontStyle.normal)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.grey[700],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                      MyCard(offstage: true,),
                      MyCard(offstage: true,),
                      MyCard(
                        myPosition: 0,
                        gradientColors: [Colors.green[900], Colors.green],
                        dayDetails: ["1", "FEB", "2020"],
                        title: "Initiation",
                      ),
                      MyCard(
                        myPosition: 1,
                        gradientColors: [Colors.red, Colors.orange[400]],
                        dayDetails: ["2", "FEB", "2020"],
                        title: "Duality",
                      ),
                      MyCard(
                        myPosition: 2,
                        gradientColors: [Colors.deepOrange, Colors.deepOrangeAccent],
                        dayDetails: ["3", "FEB", "2020"],
                        title: "Completeness",
                      ),
                      MyCard(
                        myPosition: 3,
                        gradientColors: [Colors.cyan[700], Colors.cyan],
                        dayDetails: ["4", "FEB", "2020"],
                        title: "Recreate",
                      ),
                      MyCard(
                        myPosition: 4,
                        gradientColors: [Colors.red, Colors.blue],
                        dayDetails: ["5", "FEB", "2020"],
                        title: "Freedom",
                      ),
                      MyCard(
                        myPosition: 5,
                        gradientColors: [Colors.blue, Colors.blue],
                        dayDetails: ["6", "FEB", "2020"],
                        title: "Focus",
                      ),
                      MyCard(
                        myPosition: 6,
                        gradientColors: [Colors.blue, Colors.pink[400]],
                        dayDetails: ["7", "FEB", "2020"],
                        title: "Perfection",
                      ),
                      MyCard(
                        myPosition: 7,
                        gradientColors: [
                          Colors.green[800],
                          Colors.green
                        ],
                        dayDetails: ["8", "FEB", "2020"],
                        title: "New beginnings",
                      ),
                      MyCard(
                        myPosition: 8,
                        gradientColors: [Colors.pink[800], Colors.pink],
                        dayDetails: ["9", "FEB", "2020"],
                        title: "Universal Love",
                      ),
                      MyCard(
                        myPosition: 9,
                        gradientColors: [Colors.black, Colors.white],
                        dayDetails: ["10", "FEB", "2020"],
                        title: "Law",
                      ),
                      MyCard(
                        myPosition: 10,
                        gradientColors: [Colors.indigo, Colors.purple],
                        dayDetails: ["11", "FEB", "2020"],
                        title: "Power",
                      ),
                      MyCard(
                        myPosition: 11,
                        gradientColors: [Colors.blue[800], Colors.blue[500]],
                        dayDetails: ["12", "FEB", "2020"],
                        title: "Divinity",
                      ),
                      MyCard(
                        myPosition: 12,
                        gradientColors: [Colors.lightBlue, Colors.blue],
                        dayDetails: ["13", "FEB", "2020"],
                        title: "Flutter is Awesome",
                      ),
                      MyCard(
                        myPosition: 13,
                        gradientColors: [Colors.red, Colors.red],
                        dayDetails: ["14", "FEB", "2020"],
                        title: "Happy Valentine",
                      ),
                    ],
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MyBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  final List<Color> gradientColors;
  final List<String> dayDetails;
  final String title;
  static double position;
  final int myPosition;
  final bool offstage;

  MyCard(
      {this.gradientColors,
      this.dayDetails,
      this.title,
      this.myPosition, this.offstage = false});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> with TickerProviderStateMixin{
  Gradient getColor() {
    if (MyCard.position.toInt() != widget.myPosition) {
      return LinearGradient(colors: [Colors.grey]);
    } else {
      return LinearGradient(colors: widget.gradientColors);
    }
  }

  Gradient grad;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..forward();
    controller2 = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward()..repeat(reverse: true);
  }

  AnimationController controller;
  var tween =
      Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.slowMiddle));

  AnimationController controller2;
  var tween2 =
  Tween<double>(begin: 1, end: 1.5).chain(CurveTween(curve: Curves.ease));


  @override
  Widget build(BuildContext context) {
    if(widget.offstage){
      return Container();
    }
    return ScaleTransition(
      scale: controller.drive(tween),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 11),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(30),
            width: 200,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: "${widget.dayDetails[0]}\n",
                              children: [
                                TextSpan(
                                    text: "${widget.dayDetails[1]}\n",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                                TextSpan(
                                    text: "${widget.dayDetails[2]}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white))
                              ],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                    ScaleTransition(
                      scale: controller2.drive(tween2),
                      child: Icon(
                          Icons.favorite,
                          size: 35,
                        color: Colors.white,

                      ),
                    ),
                  ],
                ),
                Align(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.centerLeft,
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: widget.gradientColors),
            ),
          ),
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}

class MyBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.edit,
            size: 23,
            color: Colors.grey[700],
          ),
          Icon(
            Icons.terrain,
            size: 23,
            color: Colors.grey[700],
          ),
          Icon(
            Icons.person_outline,
            size: 23,
            color: Colors.grey[700],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}
