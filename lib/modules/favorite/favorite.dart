import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Favorite',style: TextStyle(color: Colors.black),),
      ),
      body:const Center(
        child:Text('Favorite'),
      ),
    );
  }
}
