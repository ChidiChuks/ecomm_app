import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Personal Imports
import 'package:ecomm_app/pages/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
  String groupValue = "male";

  // SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // TODO:: Logo to show on the background image
          // Container(
          //   alignment: Alignment.topCenter,
          //   child: Text(
          //     "Ecomm_App",
          //     style: TextStyle(
          //       fontSize: 25,
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //       // decoration: TextDecoration.underline,
          //     ),
          //   ),
          // ),
          Image.asset(
            'images/bg/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Overlay on background image
          Container(
            color: Colors.black.withOpacity(0.7),
            width: double.infinity,
            height: double.infinity,
          ),
          // Logo image
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Container(
              alignment: Alignment.topCenter,
              // width: double.infinity,
              // height: double.infinity / 4,
              child: Text(
                "ShopApp",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Login Form
          Padding(
            padding: const EdgeInsets.only(top: 170.0),
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // Name
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "Full name",
                                icon: Icon(Icons.person_outline),
                                // border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The name field cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      // Sex value
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Container(
                          color: Colors.white.withOpacity(0.45),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "male",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                    // fillColor: ,
                                    activeColor: Theme.of(context).primaryColor,
                                    value: "male",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "female",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Radio(
                                    value: "female",
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Email Input Tab
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintText: "Email ",
                                icon: Icon(Icons.email),
                                // border: OutlineInputBorder(),
                              ),
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      // Password Input Tab
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                hintText: "Password ",
                                icon: Icon(Icons.lock_outline),
                                // border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters long";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      // Confirm password
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                hintText: "Confirm Password ",
                                icon: Icon(Icons.lock_outline),
                                // border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters long";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      // Login Button
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.orange[800],
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Sign up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      //Text Divider
                      Divider(
                        color: Colors.white,
                      ),
                      Text(
                        "Other sign up option",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                        ),
                      ),
                      //
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.green[800],
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {
                              // handleSignIn();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
      //     child: FlatButton(
      //       color: Colors.red,
      //       onPressed: () {
      //         handleSignIn();
      //       },
      //       child: Text(
      //         "Sign in / Sign up with Google",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender =  e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }
}
