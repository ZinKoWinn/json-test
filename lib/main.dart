
import 'package:flutter/material.dart';

import 'client/api-client.dart';
import 'model/course-model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Course>> courseList;

  @override
  void initState() {
    super.initState();
    courseList = fetchDataFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: courseList,
        builder: (context, AsyncSnapshot<List<Course>> snapShot) {
          if (snapShot.hasData) {
            
            return ListView.builder(
              itemCount: snapShot.data.length,
              itemBuilder: (context, index) {
                Course course = snapShot.data[index];
                print(snapShot.data[index]);
                return Column(
                  children: [
                    ListTile(
                      title: Text(course.name),
                      subtitle: Text(course.content),
                    ),
                    Text('${course.startdate}'),
                    Text(course.duration),
                    Text("${course.fees}"),
                    Image.network(
                      course.image,
                      fit: BoxFit.cover,
                    )
                  ],
                );
              },
            );
          } else if (!snapShot.hasData) {
            return Center(
              child: Text(
                "Empty Data",
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
