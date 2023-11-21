import 'package:flutter/material.dart';
import 'LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}


/* void test() {
  final name = 'foo';
  if (name == 'foo') {
    print('yes its is');
  } else if (name != 'Bar') {
    //when it falls in an if its stop and ends
    print("this value is not bar");
  } else {
    print('i dint know waht this is');
  }
}

//operators
void test2() {
  final age = 20;
  final halfage = age / 2;
  int? agein = 28;
  agein = null;
  List<String?>? namess = ['foo', 'Bar', null];
  namess = null;
}

void teststring(String? name, String nachname) {
  const String? firstName = null;
  const String? middleName = 'Bar';
  const String? lastName = 'Bar';
  const firstNonNullvalue = firstName ?? middleName ?? lastName;
//?? choose either left or right witch is not null
  String? choosename = firstName;
  name ??= middleName;
  print(name);
}

class Person {
  final String NAme;
  Person(this.NAme);

  void printName() {
    //print(this.NAme);
    //refere to the current instan of this class
    //avoid the thius key unless u need it
    print(NAme);
  }
}

class LivinThing {
  void breathe() {
    print('libing is breathing');
  }

  void move() {
    print('libing is moving ');
  }
}

class Cat extends LivinThing {
  final String name;
  Cat(this.name);
  factory Cat.flutBall() {
    return Cat('Flussball');
  }
}

void testing() {
  final fluffers = Cat('Fluffball');
  fluffers.move();
  fluffers.breathe();
  final cat1 = Cat("foo");
  final cat2 = Cat("foo");

  if (cat1 == cat2) {
    print("equal");
  } else {
    print("NOT EQUAL");
  }
  //factory constructor prodcut ,
}
 */
