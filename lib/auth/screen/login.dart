import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel/auth/screen/register.dart';
import 'package:hotel/auth/service/auth_service.dart';
import 'package:hotel/auth/service/fn.dart';
import 'package:hotel/auth/service/helper.dart';
import 'package:hotel/auth/service/service.dart';
import 'package:hotel/screen/widget/CoustomButton.dart';
import 'package:hotel/screen/widget/textformfield.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class Login extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  String email = "";
  String password = "";
  bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/rakabtw_-M3YuHIpgmSY-unsplash.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormFieldWidgetadmin(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "PLEASE ENETER VALID PASSWORD";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      prefixIcon: Icons.email,
                      controller: _emailcontroller,
                      hintText: "Enter the email id",
                      errorText: 'please enter the valid email'),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormFieldWidgetadmin(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "P";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    prefixIcon: Icons.password,
                    controller: _passwordcontroller,
                    hintText: "Enter the password",
                    errorText: ' password',
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButtonWidget(
                  buttonText: "LOGIN",
                  onPressed: () async {
                    await login();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SignInButton(
                    buttonType: ButtonType.google,
                    onPressed: () {
                      AuthService().googleSignUp(context);
                    }),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                    },
                    child: const Text("register"))
              ],
            ),
          ),
        ],
      ),
    );
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        // ignore: unrelated_type_equality_checks
        if (value == UserCredentialConstant.user) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['email']);

          // ignore: u se_build_context_synchronously, use_build_context_synchronously
          nextScreenReplace(
              // ignore: use_build_context_synchronously
              context, Page, FirebaseAuth.instance.currentUser!.uid);
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
