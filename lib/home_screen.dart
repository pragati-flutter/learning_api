import 'dart:convert';

import 'package:flutter/material.dart';

import 'Models/PostsModel.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel>postList = [];

  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Course"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(), builder: (context, snapShot) {
              if (!snapShot.hasData) {
                return const Text('Loading');
              } else {
                return ListView.builder(

                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                            const Text('Title',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              Text( postList[index].title.toString()),
                              const Text('Body',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                Text( postList[index].body.toString()),

                                                  ]
                                                  ),
                          ) );
                    }

                );
              }
            }),
          )
        ],
      ),
    );
  }
}
