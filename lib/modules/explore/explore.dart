import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Explore',style: TextStyle(color: Colors.black),),
      ),
      body:const Center(
        child:Text('Explore'),
      ),
    );
  }
}
