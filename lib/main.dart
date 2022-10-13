import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/modules/onBoarding/onboarding.dart';
import 'package:online_groceries/shared/base_cubit/cubit.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';
import 'package:online_groceries/shared/components/components.dart';
import 'package:online_groceries/shared/network/local/cache_helper.dart';
import 'package:online_groceries/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnlineCubit(),
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
                nextScreen: const OnBoarding(),
                splashTransition: SplashTransition.scaleTransition,
                backgroundColor: Colors.green[500]!,
                //type: AnimatedSplashType.StaticSplashScreen,
              ),
            );
          }),
    );
  }
}