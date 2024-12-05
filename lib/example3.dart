import 'package:flutter/material.dart';
import 'dart:convert';
import 'Models/UserModel.dart';
import 'package:http/http.dart' as http;

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {

  List<UserModel> userList = [];

  Future<List<UserModel>>getUserApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
var data = jsonDecode(response.body.toString());
if(response.statusCode == 200){
for(Map i in data){
  userList.add(UserModel.fromJson(i));
}
return  userList;
}else{
return userList;
}


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api learning"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getUserApi(), builder: (context,snapShot){
              return ListView.builder(
                itemCount: userList.length,
                  itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.all(0.8),
                  child: Card(
                  child: Column(
                    children: [
                      ReusableRow(title: 'name', value: snapShot.data![index].name.toString()),
                      ReusableRow(title: 'username', value: snapShot.data![index].username.toString()),
                      ReusableRow(title: 'email', value: snapShot.data![index].email.toString()),
                      ReusableRow(title: 'Address', value: snapShot.data![index].address!.geo!.lat.toString()),
            
                    ],
                  ),
                  ),
                );
              });
            }),
          )
        ],
      ),



    );
  }
}



class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key,required this.title,required this.value}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
Text(title),
        Text(value)
      ],
    );
  }
}
