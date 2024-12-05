import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class Example4 extends StatefulWidget {
  const Example4({super.key});

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4> {

  var  data;
   Future <void>getUserApi()async{
     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

     if(response.statusCode == 200){
       data = jsonDecode(response.body.toString());
     }else{

     }

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fetching data"),

      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getUserApi(), builder: (context,snapShot){
             if(snapShot.connectionState == ConnectionState.waiting){
               return const Text("Loading");
             }else{
               print("data length + ${data.length}");
               return ListView.builder(
            itemCount: data.length,

                 itemBuilder: ( context,  index) {
            return Card(
            child:Column(
              children: [
                ReusableRow(title: 'name', value:data[index]['name'].toString() ),
                ReusableRow(title: 'username', value:data[index]['username'].toString() ),
                ReusableRow(title: 'email', value: data[index]['email'].toString()),
                ReusableRow(title: 'address', value:data[index]['address']['street'].toString() ),
                ReusableRow(title: 'lat', value: data[index]['address']['geo']['lat'].toString()),
                ReusableRow(title: 'lng', value: data[index]['address']['geo']['lng'].toString()),
              ],
            ),
            
            );
            
               },
            
            
            
               );
             }
            }),
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
   ReusableRow({ Key? key, required this.title,required this.value} ):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}

