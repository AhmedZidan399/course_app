import 'dart:convert';
import '../models/courseModel.dart';
import 'package:http/http.dart' as http;



class Course {
  List<CourseModel> courses = [];

  Future<void> getCourse() async {
    var url = 'https://www.udemy.com/api-2.0/courses/?page=2&page_size=12';
    var clientId = 'Said Sabry';
    var clientSecret = '145800said';
    var credentials = base64.encode(utf8.encode('$clientId:$clientSecret'));

    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic $credentials',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var results = jsonData['results'] as List<dynamic>;
      results.forEach((element) {
        CourseModel courseModel = CourseModel(
          heading: element['title'],
          image: element['image_480x270'],
          courseLink: element['url'],
          successRate: '', // You can add the success rate if it's available in the API response
        );
        courses.add(courseModel);
      });
    } else {
      print('Failed to fetch courses: ${response.statusCode}');
      print('Response body: ${response.body}');
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
