import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/shared/base_cubit/cubit.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';
import 'package:online_groceries/shared/components/components.dart';

class Beverages extends StatelessWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnlineCubit, OnlineStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Beverages',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.tune),
                ),
              ],
              leading: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.arrow_back_ios),
              ),
            ),
            body: productBuilder(context),
          );
        });
  }

  Widget productBuilder(context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: GridView.count(
                childAspectRatio: 1 / 1.4,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                    OnlineCubit.get(context).beverages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, right: 10),
                          child: buildProductItem(
                              OnlineCubit.get(context).beverages[index],
                              context),
                        )),
              ),
            ),
          ],
        ),
      );
}
