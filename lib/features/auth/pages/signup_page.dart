import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/constants/global_variables.dart';
import 'package:hayaath_shopping/features/auth/pages/login_page.dart';
import '../../../common/roundbutton.dart';
import '../../../theme/colors.dart';
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

  final _signUpKey = GlobalKey<FormState>();

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
                    ),
                    AuthTextField(
                      controller: emailController,
                      labelText: 'Email',
                    ),
                    AuthTextField(
                      controller: passwordController,
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topRight,
                      child: RoundedButton(
                        label: 'Sign UP',
                        onTap: () {},
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
