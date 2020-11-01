import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('About'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Hola ${Get.arguments.toString()}',
              style: TextStyle(fontSize: 24),
            )),
      ),
    );
  }
}
