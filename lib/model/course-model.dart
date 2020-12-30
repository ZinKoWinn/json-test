import 'dart:convert';

List<Course> courseFromJson(String data) =>
    List<Course>.from(json.decode(data).map((json) => Course.fromJson(json)));

String courseToJson(List<Course> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class Course {
  int id;
  String name;
  String content;
  String image;
  DateTime startdate;
  String duration;
  int fees;

  Course(
      {this.id,
      this.name,
      this.content,
      this.image,
      this.startdate,
      this.duration,
      this.fees});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'],
        name: json['name'],
        content: json['content'],
        image: json['image'],
        startdate: json['start_date'],
        duration: json['duration'],
        fees: json['fees'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "image": image,
        "start_date": startdate,
        "duration": duration,
        "fees": fees,
      };
}
