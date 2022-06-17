import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DatabaseReference _databaseReference;

  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
    super.initState();
  }

  bool temvalue = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // buildGestureDetector("Sleep",_Sleepvalue()),
            //
            // buildGestureDetector("Shout Down",_ShoutDownvalue()),
            //
            //  buildGestureDetector("Restart",_Restartvalue()),
            //
            // buildGestureDetector("Minimize",_Minimizevalue()),

            // buildGestureDetector("Button5"),
            GestureDetector(
              onTap: () {
                setState(() {
                  setState(() {
                    _Sleepvalue();
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.all(30),
                height: height * 0.07,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Sleep",
                    style: TextStyle(
                        fontSize: height * 0.014, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height*0.01,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  setState(() {
                    _ShoutDownvalue();
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.all(30),
                height: height * 0.07,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Shout Down",
                    style: TextStyle(
                        fontSize: height * 0.014, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height*0.01,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  setState(() {
                    _Minimizevalue();
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.all(30),
                height: height * 0.07,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Minimize",
                    style: TextStyle(
                        fontSize: height * 0.014, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height*0.01,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  setState(() {
                    _Restartvalue();
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.all(30),
                height: height * 0.07,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    "Restart",
                    style: TextStyle(
                        fontSize: height * 0.014, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height*0.01,
            ),

          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(
    String text,
  ) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          // onchanged;
        });
      },
      child: Container(
        margin: EdgeInsets.all(30),
        height: height * 0.07,
        width: width * 0.3,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: height * 0.014, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _Minimizevalue() {
    _databaseReference
        .child("Control")
        .child("Minimize")
        .update({'Value': true});
    // child('Control').update({'Value': false});
  }

  _Sleepvalue() {
    _databaseReference.child("Control").child("Sleep").update({'Value': true});
  }

  _ShoutDownvalue() {
    _databaseReference
        .child("Control")
        .child("Shutdown")
        .update({'Value': true});
  }

  _Restartvalue() {
    _databaseReference
        .child("Control")
        .child("Restart")
        .update({'Value': true});
  }
}
