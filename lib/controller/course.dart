import 'dart:convert';
import '../models/courseModel.dart';
import 'package:http/http.dart' as http;

class Course {
  List<CourseModel> course = [];

  Future<void> getCourse() async {
    var url = 'https://sumanjay.vercel.app/udemy';
    var response = await http
        .get(Uri.parse(url), headers: {'Access-Control-Allow-Origin': '*'});
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      jsonData.forEach((element) {
        CourseModel courseModel = CourseModel(
          heading: element['title'],
          image: element['image'],
          courseLink: element['link'],
          successRate: '',
        );
        course.add(courseModel);
      });
    } else {
      print(response.statusCode);
    }
  }
}

class CategoryCourse {
  List<CourseModel> course = [];

  Future<void> getCourse(String category) async {
    var url = 'https://udemycoupon.herokuapp.com';
    var response = await http
        .get(Uri.parse(url), headers: {'Access-Control-Allow-Origin': '*'});
    if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
      jsonData[0]['$category'].forEach((element) {
        CourseModel courseModel = CourseModel(
          heading: element['heading'],
          image: element['image'],
          courseLink: element['courselink'],
          successRate: element['successrate'],
        );
        print(response.statusCode);

        course.add(courseModel);
      });
    } else {
      print(response.statusCode);
    }
  }
}
