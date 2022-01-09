// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController conpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();

  TextEditingController mbnController = TextEditingController();

  bool isChecked = false;

  final DBref = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('My Login'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  color: Colors.indigo.shade900,
                  padding: EdgeInsets.only(
                      top: 50, bottom: 50, left: 120, right: 120),
                  child: CircleAvatar(
                    maxRadius: 80,
                    backgroundImage: AssetImage('images/images.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          'FirstName',
                          style: TextStyle(
                              color: Colors.purple.shade800, fontSize: 20),
                        ),
                      ),
                      TextFormField(
                        maxLength: 100,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.purple.shade800,
                        controller: fnameController,
                        validator: (value) {
                          if (!RegExp("^([a-z]+[,.]?[ ]?|[a-z]+['-]?)")
                              .hasMatch(value!)) {
                            return 'Please enter name ';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          hintText: 'Enter Your First Name',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Text(
                        'LastName',
                        style: TextStyle(
                            color: Colors.purple.shade800, fontSize: 20),
                      ),
                      TextFormField(
                        cursorColor: Colors.purple.shade800,
                        maxLength: 100,
                        keyboardType: TextInputType.name,
                        controller: lnameController,
                        validator: (value) {
                          if (!RegExp("^([a-z]+[,.]?[ ]?|[a-z]+['-]?)")
                              .hasMatch(value!)) {
                            return 'Please enter name ';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          hintText: 'Enter Your Last Name',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Text(
                        'Mobile Number',
                        style: TextStyle(
                            color: Colors.purple.shade800, fontSize: 20),
                      ),
                      TextFormField(
                        cursorColor: Colors.purple.shade800,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: mbnController,
                        validator: (value) {
                          if (!RegExp(
                                  "^(?=[a-zA-Z0-9._]{8,20})(?!.*[_.]{2})[^_.].*[^_.]")
                              .hasMatch(value!)) {
                            return 'Please enter Mobile Number ';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          hintText: 'Enter Your Mobile Number',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.purple.shade800, fontSize: 20),
                      ),
                      TextFormField(
                        cursorColor: Colors.purple.shade800,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value!)) {
                            return 'Please enter vaild Email ';
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          hintText: 'Enter Your Email',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.purple.shade800, fontSize: 20),
                        ),
                      ),
                      TextFormField(
                        cursorColor: Colors.purple.shade800,
                        maxLength: 20,
                        obscureText: true,
                        controller: passController,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          hintText: 'Enter Password',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: Colors.purple.shade800, fontSize: 20),
                      ),
                      TextFormField(
                        cursorColor: Colors.purple.shade800,
                        maxLength: 20,
                        obscureText: true,
                        controller: conpController,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple.shade800)),
                          hintText: 'Confirm Password',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                              color: Colors.indigo.shade900,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                register(
                                    fnameController.text,
                                    lnameController.text,
                                    mbnController.text,
                                    emailController.text,
                                    passController.text);
                              } else {
                                print('unsuccesful');
                              }
                            },
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Already have an account?'),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.grey),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void register(
      String Fname, String Lname, String MbNo, String email, String Password) {
    DBref.child('path').set({
      'Firstname': Fname,
      'Lastname': Lname,
      'mobile': MbNo,
      'Email-id': email,
      'Password': Password,
    });
  }
}
