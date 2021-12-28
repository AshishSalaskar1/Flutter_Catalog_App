// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBtn = false;
  final _formKey = GlobalKey<FormState>();

  moveToHomePage(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeBtn = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(
          context, MyRoutes.homeRoute);
      setState(() {
        changeBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/hey.png",
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  Text(
                    "Welcome ${name}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.blue.shade800),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          validator: (value) {
                            return (value!.isEmpty)?"Username cant be empty":null;
                          },
                          decoration: InputDecoration(
                              labelText: "Username",
                              hintText: "Enter Username"),
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (value){
                            return (value!.isEmpty)?"Password cant be empty":null;
                          },
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter Password"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () => moveToHomePage(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 50,
                      width: changeBtn ? 50 : 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: changeBtn
                              ? Colors.green
                              : Colors.deepPurple,
                          shape: changeBtn
                              ? BoxShape.circle
                              : BoxShape.rectangle),
                      child: changeBtn
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
