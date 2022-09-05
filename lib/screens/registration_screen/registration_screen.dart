import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_weather/screens/registration_screen/controller/registration_controller.dart';
import 'package:new_weather/services/routes/route_names.dart';
import 'package:new_weather/utils/styles.dart';
import 'package:new_weather/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKeyDetails = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  final RegistrationController _registrationController =
      Get.put(RegistrationController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration', style: Styles.appBarTitleTS),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(children: [
            Icon(Icons.wb_sunny_outlined, size: 200, color: Colors.blue),
            Form(
              key: _formKeyDetails,
              child: Column(
                children: [
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
                  CustomTextField(
                    labelText: "Re-type Your Password",
                    errorText: "Does not match",
                    myController: rePasswordController,
                    backgroundColor: Colors.white,
                    errorColor: Colors.red,
                    themeColor: Styles.primaryColor,
                    floatingTextStyle: Styles.label1TS,
                    labelTextStyle: Styles.label1TS,
                    validator: (value) {
                      if (value! == passwordController.text) {
                        return null;
                      } else {
                        return "Password Does not match";
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKeyDetails.currentState!.validate()) {
                  _registrationController.createUser(
                      emailController.text, passwordController.text);
                }
              },
              child: Container(
                  width: 50.w,
                  alignment: Alignment.center,
                  child: const Text('Sign up', style: Styles.buttonTS)),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAndToNamed(RouteNames.login);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Container(
                    width: 50.w,
                    alignment: Alignment.center,
                    child: Text('Log in',
                        style: Styles.buttonTS.copyWith(color: Colors.black)))),
            // ElevatedButton(
            //     onPressed: () {
            //       // Get.offAndToNamed(RouteNames.registration);
            //     },
            //     style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            //     child: Container(
            //         width: 50.w,
            //         alignment: Alignment.center,
            //         child: Text('Skip Log in',
            //             style: Styles.buttonTS.copyWith(color: Colors.black)))),
          ]),
        ),
      ),
    );
  }
}
