import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/constants/global_variables.dart';
import 'package:hayaath_shopping/features/auth/pages/signup_page.dart';
import '../../../common/roundbutton.dart';
import '../../../theme/colors.dart';
import '../widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = '/loginpage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _logInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _logInFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Welcome Back to Hayaath 🦄',
                          style: TextStyle(
                              color: Pallete.pureblack,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontStyle: FontStyle.italic),
                        )),
                    rrHeight60,
                   AuthTextField(
                      controller: emailController,
                      labelText: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please Enter your Email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                    AuthTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value == null) {
                          return 'Please enter password';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Enter valid password';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: RoundedButton(onTap: () {}, label: 'Done')),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have an account?",
                            style: const TextStyle(
                                fontSize: 16, color: Pallete.pureblack),
                            children: [
                              TextSpan(
                                  text: '  Sign up',
                                  style: const TextStyle(
                                      color: Pallete.purpleColor, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, SignUPage.routeName);
                                    })
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
