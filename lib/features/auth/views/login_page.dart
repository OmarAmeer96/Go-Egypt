import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_egypt/features/auth/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/title_text.dart';
import 'welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //get email and password data from shared preferences
  String email = '';
  String password = '';
  getCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email") ?? "";
    password = prefs.getString("pass") ?? "";
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
              key: Constants.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //call "TitleText" to add title "Login"
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TitleText(tr('Login'), 40),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  //call "CustomTextField" to ask the user to enter his email address and validate his input
                  CustomTextField(
                    controller: Constants.loginEmailController,
                    label: tr("email_address"),
                    prefix: Icons.email,
                    //use "validator" to check if the user input meets requirements
                    validator: (value) {
                      if (!value!.contains("@")) {
                        return tr("please_enter_a_valid_email");
                      } else {
                        return null;
                      }
                    },
                  ),
                  //call "CustomTextField" to ask the user to enter his password
                  CustomTextField(
                    controller: Constants.loginPasswordController,
                    label: tr("password"),
                    prefix: Icons.lock,
                    validator: (value) {
                      if (value!.length < 6) {
                        return tr(
                            "password_should_contain_at_least_6_characters");
                      } else {
                        return null;
                      }
                    },
                    isPassword: true,
                    obscureText: Constants.loginIsPassHidden,
                    //convert the value of "loginIsPassHidden" variable when pressing the suffix icon to show and hide password
                    onSuffixPressed: () {
                      setState(() {
                        Constants.loginIsPassHidden =
                            !Constants.loginIsPassHidden;
                      });
                    },
                  ),
                  //call "CustomButton" to add a "login" button
                  CustomButton(
                      onPressed: () {
                        //if the user inputs meet all requirements, navigate to another page
                        if (Constants.loginFormKey.currentState!.validate()) {
                          if (Constants.loginEmailController.text == email &&
                              Constants.loginPasswordController.text ==
                                  password) {
                            Constants.loginEmailController.clear();
                            Constants.loginPasswordController.clear();
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Welcome();
                              },
                            ));
                          } else {
                            //if a problem is found, a snackBar will show up
                            SnackBar snackBar = const SnackBar(
                              content: Text("Incorrect email or password"),
                              duration: Duration(seconds: 3),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                      text: tr("Login"))
                ],
              )),
        ),
      ),
    );
  }
}
