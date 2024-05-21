// ignore_for_file: unused_import

import 'dart:math';

import 'package:course_app/auth/screens/Welcome.dart';
import 'package:course_app/view/pages/courseHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: SvgPicture.asset(
                  "assetes/images/intro.svg",
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Find Your Favorite Course",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff232323),
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Browse our wide selection of courses and start learning today!.\nThis site helps you learn a wide variety of courses across multiple fields",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => Welcome()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff6cc4ee),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
