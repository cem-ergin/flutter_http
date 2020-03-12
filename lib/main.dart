import 'package:flutter/material.dart';
import 'package:json_placeholder/configs/requests.dart';
import 'package:json_placeholder/models/employee.dart';
import 'package:json_placeholder/models/post.dart';

void main() => runApp(MyApp());

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
  //Future<List> myData;
  // Future<List<Post>> myData;
  Future<Employee> myData;

  @override
  void initState() {
    super.initState();
    myData = getEmployees();
    myData.then((val){
      print(val.status); //bu json'in status'u, response status code degil.
      print(val.data.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: myData,
        builder: (BuildContext context, AsyncSnapshot<Employee> snapshot) {
          //print(snapshot.data.status);

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot == null ? 0 : snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                  title: Text(snapshot.data.data[index].employeeName),
                  subtitle: Text(snapshot.data.data[index].employeeAge),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
