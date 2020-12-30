
import 'package:http/http.dart' as http;
import 'package:json_test/model/course-model.dart';

Future<List<Course>> fetchDataFromJson() async {
  const jsonUrl = "http://192.168.99.218:8080/course";

  final response = await http.get(jsonUrl);
  final course = courseFromJson(response.body);
  print(response.body);
  return course;
}
