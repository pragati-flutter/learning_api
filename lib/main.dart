import 'package:flutter/material.dart';
import 'package:xyzzzzzzz/Models/example2.dart';
import 'package:xyzzzzzzz/Models/sign_up.dart';
import 'package:xyzzzzzzz/example3.dart';
import 'package:xyzzzzzzz/home_screen.dart';

import 'package:http/http.dart'as http;
import 'package:xyzzzzzzz/upload_image.dart';

import 'example4.dart';
import 'example5.dart';
import 'log_in.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return    const MaterialApp(
      title: 'Flutter Demo',
      home:UploadImage(),
    );
  }
}
