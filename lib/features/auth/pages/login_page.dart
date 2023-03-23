import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hayaath_shopping/constants/global_variables.dart';
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
                        controller: emailController, labelText: 'Email'),
                    AuthTextField(
                        controller: passwordController, labelText: 'Password'),
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
                                          context, LoginPage.routeName);
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
