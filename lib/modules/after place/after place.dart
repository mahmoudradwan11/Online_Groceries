import 'package:flutter/material.dart';

class AfterPay extends StatelessWidget {
  const AfterPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  child: Image(
                image: AssetImage('images/Rectangle 17.png'),
                //fit: BoxFit.cover,
                height: 500,
              )),
              const Positioned(
                  top: 200,
                  left: 50,
                  child: Image(image: AssetImage('images/Group 6872.png'))),
              const Positioned(
                top: 450,
                // left: 20,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.8),
                  child: Text(
                    'Your Order has been accepted',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
