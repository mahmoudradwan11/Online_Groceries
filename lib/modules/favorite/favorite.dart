import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/shared/base_cubit/cubit.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';
import 'package:online_groceries/shared/components/components.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnlineCubit, OnlineStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnlineCubit.get(context);
          var favorite = cubit.favorites;
          var scaffoldKey = GlobalKey<ScaffoldState>();
          if (favorite.isEmpty) {
            return Scaffold(
              backgroundColor: Colors.white,
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text(
                  'Favorite',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: const Center(
                child: Image(image: AssetImage('images/image 13.png'),),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text(
                  'Favorite',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Column(
                  children: [
                    Container(
                      color: Colors.grey[200],
                      height: 1,
                      width: double.infinity,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              buildFavoriteItem(favorite[index], context),
                          separatorBuilder: (context, index) => builtDivider(),
                          itemCount: favorite.length),
                    ),
                  ]
              ),
            );
          }
        }
    );
  }
  Widget buildFavoriteItem(Map model,context)=>Dismissible(
    key:Key(model['id'].toString()),
    onDismissed:(direction)
    {
       OnlineCubit.get(context).deleteFavoriteData(id: model['id']);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          width: double.infinity,
          //color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image(image: AssetImage(model['image']),height: 60,width: 90,),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(model['name'],style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Jannah'),),
                Text(model['size'],style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Jannah'),)
              ],),
              const Spacer(),
              Text(model['price'],style:const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Jannah'),)
            ],
          ),
        ),
      ),
    ),
  );
}