import 'package:backendfinal/services/remote_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:backendfinal/models/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TOP Games'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void iniState(){
    super.initState();

    getData();
  }

  getData() async{
    posts = await RemoteService().getPosts();
    if(posts != null)
      {
        setState(() {
          isLoaded = true;
        });
      }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body:
          Visibility (
            visible: isLoaded,
            child:
          ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
            return Container(
              child:
                Text(posts![index].title),

            );
          },
          ),
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
          ),

    );
  }
}