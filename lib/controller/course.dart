import 'dart:convert';
import '../models/courseModel.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;



class Course {
  List<CourseModel> course = [];

  Future<void> getCourse() async {
    var url = 'https://courses.edx.org/api/courses/v1/courses/';
    var response = await http
        .get(Uri.parse(url), headers: {'Access-Control-Allow-Origin': '*'});
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      // Assuming the jsonData is a map containing a 'results' key
      var results = jsonData['results'];
      results.forEach((element) {
        CourseModel courseModel = CourseModel(
          heading: element['name'],  // 'name' field for course title
          image: element['media']['image']['raw'],  // 'raw' field for the image URL
          courseLink: element['blocks_url'],  // 'blocks_url' field for the course link
          successRate: '',  // Assuming successRate is not provided in the API response
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
