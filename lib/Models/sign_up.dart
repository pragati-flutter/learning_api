import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController  emailController  = TextEditingController();
  TextEditingController  passwordController  = TextEditingController();

  void login(String email,password) async{
    try{
Response response = await post(
  Uri.parse('https://reqres.in/api/register'),
  body:{
    'email':email,
    'password':password
  }
);
if(response.statusCode == 200){
  var data = jsonDecode(response.body.toString());
  print("account created successfully");
  print(data);
  print(data['token']);
}else{
  print("failed");
}



    }catch(e){
   print(e.toString());
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email'
            ),
          ),
      const SizedBox(height: 20,),

      TextFormField(
      controller: passwordController,
      decoration: const InputDecoration(
          hintText: 'Password'
      ),
      ),
          const SizedBox(
            height: 20,
          ),


          const SizedBox(
            height: 40,
          ),

          GestureDetector(
            onTap: () {
             login(emailController.text.toString(),passwordController.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(
                child: Text(
              "SignUp"
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
