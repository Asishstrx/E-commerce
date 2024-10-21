// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, must_be_immutable

import 'dart:developer';

import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/Login&signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInpage extends StatelessWidget {
  SignInpage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController resetemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future signin() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ));
      } catch (e) {
        log(e.toString());
      }
    }

    Future forgot() async {
      try {
        if (resetemail.text.contains('@')) {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: resetemail.text);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Email sent Successfully',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
              action: SnackBarAction(label: 'Cancel', onPressed: () {}),
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("An Error Occured ${e.toString()}"),
          ),
        );
      }
    }

    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                fillColor: Colors.grey[100],
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                contentPadding: EdgeInsets.all(10.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                fillColor: Colors.grey[100],
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                contentPadding: EdgeInsets.all(10.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        'Verify Your Email',
                        style: TextStyle(color: Colors.black),
                      ),
                      content: TextField(
                        controller: resetemail,
                        decoration: InputDecoration(
                          labelText: 'Email to verify',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          fillColor: Colors.grey[100],
                          filled: true,
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          contentPadding: EdgeInsets.all(10.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(style: BorderStyle.none),
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            forgot();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black),
                          ),
                          child: Text(
                            'Verify',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Forgot Password!',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.lightBlueAccent),
                ),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                signin();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                fixedSize:
                    WidgetStatePropertyAll(Size.fromWidth(screenwidth * 1)),
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.lightBlueAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.lightBlueAccent),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
