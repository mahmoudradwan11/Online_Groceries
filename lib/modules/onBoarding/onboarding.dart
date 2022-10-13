import 'package:flutter/material.dart';
import 'package:online_groceries/modules/login/login.dart';
import 'package:online_groceries/shared/components/components.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('images/Carrot.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'to our store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Ger your groceries in as fast as one hour',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                defButton(
                    function: () {
                      navigateTo(context,Login());
                    },
                    text: 'Get Started',
                    width: 350,
                    heigth: 67,
                    isUpper: false,
                    background: Colors.green[400]
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

