import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter practice',
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.brown),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var title = "Flutter container";

  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  var passtext = TextEditingController();
}

class _MyHomePageState extends State<MyHomePage> {
  Color myColor = Colors.transparent;
  TextEditingController weight_Controller = new TextEditingController();
  TextEditingController height_Controller = new TextEditingController();
  var main_result = TextEditingController();

  CalCulate_BMI(String weight, String height) async {
    var myDouble_weight = double.parse(weight);
    assert(myDouble_weight is double);
    var myDouble_height = double.parse(height);
    assert(myDouble_height is double);

    var res = (myDouble_weight / (myDouble_height * myDouble_height));

    setState(() {
      main_result.text = res.toStringAsFixed(2);
      if (res < 18.5) {
        myColor = Colors.lightGreen;
      } else if (res > 18.5 && res < 24.5) {
        myColor = Colors.orange;
      } else if (res > 25 && res < 29.5) {
        myColor = Colors.pink;
      } else if (res > 30 && res < 34.9) {
        myColor = Colors.red;
      } else if (res > 35) {
        myColor = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("BMI Calculator"),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            unselectedIconTheme: const IconThemeData(color: Colors.red),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Homes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_alert_sharp),
                label: 'Alerts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [const Color(0xFF6DD5ED), const Color(0xFF2193B0)])),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "BMI Calculator",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0038FF),
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                          child: TextField(
                            controller: weight_Controller,
                            keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Enter your weight in (KG)",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                          child: TextField(
                            controller: height_Controller,
                            autofocus: false,
                            keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Enter your height in (M)",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Center(
                            child: SizedBox(
                              width: 180,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  CalCulate_BMI(
                                      weight_Controller.text, height_Controller.text);
                                },
                                child: Text(
                                  "Calculate",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(Color(0xFF0038FF)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: Container(
                            width: 300,
                            height: 100,
                            decoration: BoxDecoration(
                                color: myColor,
                                borderRadius: BorderRadius.all(Radius.circular(12))),
                            child: Center(
                              child: Text(
                                "BMI:" + main_result.text,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  Text(
                                    "Underweight",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                  ),
                                  Text(
                                    "Normal",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                    ),
                                  ),
                                  Text(
                                    "Overweight",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                  ),
                                  Text(
                                    "obese",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                  ),
                                  Text(
                                    "Extreme",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
