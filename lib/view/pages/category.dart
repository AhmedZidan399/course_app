
// ignore_for_file: unused_import, library_private_types_in_public_api

import 'package:course_app/controller/course.dart';
import 'package:course_app/models/courseModel.dart';
import 'package:course_app/view/widget/CourseTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';



class Category extends StatefulWidget {
  final String category;
  const Category({super.key, required this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<CourseModel> courses = [];
  bool _loading = true;



  getCategoryCourse() async {
    CategoryCourse courseClass = CategoryCourse();
    await courseClass.getCourse(widget.category);
    courses =  courseClass.course;
    setState((){
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:   _loading ? Center(
        child: SafeArea(
          child: Container(
            child: SpinKitWave(
              color: Color(0xff99CAE1),
              size: 30.0,
            ),
          ),
        ),
        ////categories
      ) : SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CourseTile(
                  imageURL: courses[index].image,
                  title: courses[index].heading,
                  courseURL: courses[index].courseLink,
                  successRate: courses[index].successRate,

                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
