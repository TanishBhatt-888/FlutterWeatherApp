import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  void initstate() {
    super.initState();
    Firebase.initializeApp();
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                "Create New Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent.shade200,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: _name,
                keyboardType: TextInputType.text,
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.orangeAccent,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  prefixIcon: Icon(
                    Icons.password_rounded,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(padding: EdgeInsets.only(left: 70)),
            Container(
              height: 50,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Second()));
                  }).onError((error, stackTrace) {
                    print(error);
                  });
                },
                child: Text(
                  "Signup",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "If you already have an Account then",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(padding: EdgeInsets.only(left: 40)),
            Container(
                height: 50,
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Second()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
