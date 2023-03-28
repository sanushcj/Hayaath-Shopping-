import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/constants/global_variables.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import '../../../common/roundbutton.dart';
import '../../../theme/colors.dart';
import '../services/signup_service.dart';
import '../widgets/textfield.dart';

class SignUPage extends StatefulWidget {
  const SignUPage({super.key});
  static const String routeName = '/signuppage';

  @override
  State<SignUPage> createState() => _SignUPageState();
}

class _SignUPageState extends State<SignUPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final SignUpServie signUpServieController = SignUpServie();
  final _signUpKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  signup() {
    signUpServieController.signupUser(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        ctx: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _signUpKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'WELCOME TO HAYAATH SHOPPING 🛒',
                          style: TextStyle(
                              color: Pallete.pureblack,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontStyle: FontStyle.italic),
                        )),
                    rrHeight60,
                    AuthTextField(
                      controller: usernameController,
                      labelText: 'Usernane',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
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
                        if (value == null) {
                          return 'Please enter password';
                        } else {
                          if (value.length < 5) {
                            return 'Enter a Strong password';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topRight,
                      child: RoundedButton(
                        label: 'Sign UP',
                        onTap: () {
                          if (_signUpKey.currentState!.validate()) {
                            signup();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(
                            fontSize: 16, color: Pallete.pureblack),
                        children: [
                          TextSpan(
                            text: ' Login',
                            style: const TextStyle(
                              color: Pallete.purpleColor,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, LoginPage.routeName);
                              },
                          ),
                        ],
                      ),
                    ),
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
