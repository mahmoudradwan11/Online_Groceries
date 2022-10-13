import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Account',style: TextStyle(color: Colors.black),),
      ),
      body:const Center(
        child:Text('Account'),
      ),
    );
  }
}
