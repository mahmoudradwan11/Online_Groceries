import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/modules/onBoarding/onboarding.dart';
import 'package:online_groceries/shared/base_cubit/cubit.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';
import 'package:online_groceries/shared/components/components.dart';
import 'package:online_groceries/shared/components/constants.dart';
import 'package:online_groceries/shared/network/local/cache_helper.dart';
import 'package:online_groceries/shared/styles/themes.dart';

void main() async {
  //this App is Written by Eng Mahmoud Radwan
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  print('Uid = $uId');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnlineCubit()
        ..createDatabase()
        ..getUserData(),
      child: BlocConsumer<OnlineCubit, OnlineStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Online Groceries',
              theme: lightTheme,
              themeMode: ThemeMode.light,
              darkTheme: darkTheme,
              home: AnimatedSplashScreen(
                splash: logo(),
                duration: 3000,
                nextScreen: OnBoarding(),
                splashTransition: SplashTransition.scaleTransition,
                backgroundColor: Colors.green[500]!,
                //type: AnimatedSplashType.StaticSplashScreen,
              ),
            );
          }),
    );
  }
}
