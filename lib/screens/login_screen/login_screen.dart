import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_weather/screens/login_screen/controller/login_controller.dart';
import 'package:new_weather/services/routes/route_names.dart';

import 'package:new_weather/utils/styles.dart';
import 'package:new_weather/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKeyDetails = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginController _loginController = Get.put(LoginController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: Styles.appBarTitleTS),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 3.h,
            ),
            Form(
              key: _formKeyDetails,
              child: Column(
                children: [
                  Icon(Icons.cloudy_snowing, size: 200, color: Colors.blue),
                  CustomTextField(
                    labelText: "Your email id",
                    errorText: "Not a valid email.",
                    myController: emailController,
                    backgroundColor: Colors.white,
                    errorColor: Colors.red,
                    themeColor: Styles.primaryColor,
                    floatingTextStyle: Styles.label1TS,
                    labelTextStyle: Styles.label1TS,
                    validator: (value) {
                      return !EmailValidator.validate(value!, true)
                          ? 'Not a valid email.'
                          : null;
                    },
                  ),
                  CustomTextField(
                    obscureText: true,
                    labelText: "Your Password",
                    errorText: "Please type correctly",
                    myController: passwordController,
                    backgroundColor: Colors.white,
                    errorColor: Colors.red,
                    themeColor: Styles.primaryColor,
                    floatingTextStyle: Styles.label1TS,
                    labelTextStyle: Styles.label1TS,
                    validator: (value) {
                      if (value!.length > 7) {
                        return null;
                      } else {
                        return "Password needs to be atleast 8 characters long";
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKeyDetails.currentState!.validate()) {
                  await _loginController.loginUser(
                      emailController.text, passwordController.text);
                  // Get.offAllNamed(RouteNames.home,
                  //     arguments: {'isAnonymous': false});
                }
              },
              child: Container(
                  width: 50.w,
                  alignment: Alignment.center,
                  child: const Text('Log in', style: Styles.buttonTS)),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RouteNames.registration);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Container(
                    width: 50.w,
                    alignment: Alignment.center,
                    child: Text('Sign up',
                        style: Styles.buttonTS.copyWith(color: Colors.black)))),
            ElevatedButton(
                onPressed: () async {
                  await _loginController.skipLogIn();
                  // Get.offAllNamed(RouteNames.home,
                  //     arguments: {'isAnonymous': true});
                  // Get.offAndToNamed(RouteNames.registration);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Container(
                    width: 50.w,
                    alignment: Alignment.center,
                    child: Text('Skip Log in',
                        style: Styles.buttonTS.copyWith(color: Colors.black)))),
          ]),
        ),
      ),
    );
  }
}
