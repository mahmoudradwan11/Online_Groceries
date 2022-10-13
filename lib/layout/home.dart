import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/shared/base_cubit/cubit.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnlineCubit,OnlineStates>(
      listener:(context,state){},
      builder:(context,state)
      {
        var cubit = OnlineCubit.get(context);
        return Scaffold(
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.items,
            currentIndex: cubit.currentIndex,
            onTap:(index)
            {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}