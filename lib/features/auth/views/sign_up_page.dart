import 'package:flutter/material.dart';
import 'package:go_egypt/generated/l10n.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/title_text.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //use "SingleChildScrollView" to make the page scrollable
      body: Center(
        child: SingleChildScrollView(
          //use bouncing physics while scrolling
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: Constants.signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //call "TitleText" widget to add the title of the page
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TitleText(
                    S.of(context).sign_up,
                    40,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //call "CustomTextField" to ask the user to enter his full name and validate his input
                CustomTextField(
                  controller: Constants.signUpFullnameController,
                  label: S.of(context).full_name,
                  prefix: Icons.person,
                  //use "validator" to check if the user input meets requirements
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).please_enter_your_full_name;
                    } else if (!RegExp(r'[A-Z]').hasMatch(value[0])) {
                      return S.of(context).first_letter_should_be_capitalized;
                    } else {
                      return null;
                    }
                  },
                ),
                //ask the user to enter his email address
                CustomTextField(
                  controller: Constants.signUpEmailController,
                  label: S.of(context).email_address,
                  prefix: Icons.email,
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return S.of(context).please_enter_a_valid_email;
                    } else {
                      return null;
                    }
                  },
                ),
                //call "CustomTextField" to ask the user to enter his password
                CustomTextField(
                  controller: Constants.signUpPasswordController,
                  label: S.of(context).password,
                  prefix: Icons.lock,
                  validator: (value) {
                    if (value!.length < 6) {
                      return S
                          .of(context)
                          .password_should_contain_at_least_6_characters;
                    } else {
                      return null;
                    }
                  },
                  isPassword: true,
                  obscureText: Constants.signUpIsPassHidden,
                  //convert the value of "signUpIsPassHidden" variable when pressing the suffix icon to show and hide password
                  onSuffixPressed: () {
                    setState(() {
                      Constants.signUpIsPassHidden =
                          !Constants.signUpIsPassHidden;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IntlPhoneField(
                    controller: Constants.signUpPhoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    initialCountryCode: 'EG',
                    validator: (value) {
                      if (value.toString().contains(" ")) {
                        Constants.signUpPhoneNumberController.text = Constants
                            .signUpPhoneNumberController.text
                            .replaceAll(" ", "");
                      }
                      return null;
                    },
                  ),
                ),
                //call "CustomButton" to add a "sign up" button
                CustomButton(
                  onPressed: () async {
                    //if the user inputs meet all requirements, an alert dialog will show up using "signUpDialog" function
                    if (Constants.signUpFormKey.currentState!.validate()) {
                      //caching data using shared preferences
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString(
                          "name", Constants.signUpFullnameController.text);
                      prefs.setString(
                          "email", Constants.signUpEmailController.text);
                      prefs.setString(
                          "pass", Constants.signUpPasswordController.text);
                      prefs.setString(
                          "phone", Constants.signUpPhoneNumberController.text);
                      signUpDialog();
                    }
                  },
                  text: S.of(context).sign_up,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // a function created to make an alert dialog show up to tell the user that he signed up successfully
  Future<void> signUpDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).Success),
          content: Text(S.of(context).account_created_successfully),
          actions: [
            //a "close button", if the user pressed that button all the textfields will be clear and navigate to "LoginPage"
            ElevatedButton(
                onPressed: () {
                  //in order to remove the "AlertDialog" from stack then add "LoginPage" by navigating to it
                  Navigator.pop(context);
                  Constants.signUpFullnameController.clear();
                  Constants.signUpEmailController.clear();
                  Constants.signUpPasswordController.clear();
                  Constants.signUpPhoneNumberController.clear();
                  //use "Navigator.push" to navigate to another page
                  Navigator.push(
                      context,
                      //use "PageRouteBuilder" to identify the page which will navigate to and the way of transition
                      PageRouteBuilder(
                          //identify the page which we want to navigate to
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const LoginPage(),
                          //identify how the transition will be during navigation
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            //determine the speed of transition "easeInOut" to start with low speed, then high, then low again
                            var curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );
                            //create fade out and in transition
                            return FadeTransition(
                              opacity: curvedAnimation,
                              child: child,
                            );
                          },
                          transitionDuration:
                              const Duration(milliseconds: 850)));
                },
                child: Text(
                  S.of(context).close,
                  style: TextStyle(color: Constants.mainColor),
                ))
          ],
        );
      },
    );
  }
}
