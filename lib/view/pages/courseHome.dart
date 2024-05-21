// ignore_for_file: use_key_in_widget_constructors

import 'package:course_app/controller/course.dart';
import 'package:course_app/controller/data.dart';
import 'package:course_app/models/category_model.dart';
import 'package:course_app/models/courseModel.dart';
import 'package:course_app/view/widget/CategoryTile.dart';
import 'package:course_app/view/widget/CourseTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<CourseModel> courses = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getCourse();
  }

  getCourse() async {
    Course courseClass = Course();
    await courseClass.getCourse();
    setState(() {
      courses = courseClass.course;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Find your Free Courses",
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff232323),
                  ),
                ),
                SvgPicture.asset(
                  "assetes/images/love.svg",
                  color: Color(0xff99CAE1),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: SpinKitWave(
                  color: Color(0xff99CAE1),
                  size: 30.0,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Category",
                      style: GoogleFonts.notoSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff232323),
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          return CategoryTile(
                            imageURL: category.imageURL,
                            color: category.color,
                            categoryName: category.categoryName,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Courses",
                      style: GoogleFonts.notoSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff232323),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      itemCount: courses.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return CourseTile(
                          imageURL: courses[index].image,
                          title: courses[index].heading,
                          courseURL: courses[index].courseLink,
                          successRate: '',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
