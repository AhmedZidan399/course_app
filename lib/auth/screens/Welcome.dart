import 'package:flutter/material.dart';

import '../../widgets/BaseScaffold.dart';
import '../../widgets/WelcomeButton.dart';
import 'LoginScreen.dart';
import 'SignupScrean.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      widgets: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome \n',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '\nBegin with your account',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Center(
                child: Column(
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xff6cc4ee),
                        borderRadius: BorderRadius.circular(30),),
                        child: WelcomeButton(
                          buttonText: 'Login',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          color: Color(0xff6cc4ee),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(decoration: BoxDecoration(),
                      child: WelcomeButton(
                        buttonText: 'Sign Up',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        color: Color(0xFF929495),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
