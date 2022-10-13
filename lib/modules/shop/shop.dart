import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/models/Cate/cate.dart';
import 'package:online_groceries/shared/base_cubit/cubit.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';
import 'package:online_groceries/shared/components/components.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnlineCubit, OnlineStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnlineCubit.get(context);
          return Scaffold(
             body:SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const Positioned(
                            top: 40,
                            left: 175,
                            child: Image(
                              image: AssetImage('images/Group.png'),
                            )),
                        Positioned(
                          top: 90,
                          left: 80,
                          child: Row(
                            children: const [
                              Icon(Icons.location_on_outlined),
                              Text(
                                'Dhaka, Banassre',
                                style: TextStyle(
                                    fontFamily: 'Jannah', fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    height: 55,
                    child: const Center(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Store',
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 118,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('images/banner.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Exclusive Offer',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'see All',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    child: ListView.separated(
                      //physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildProductItem(cubit.exclusive[index],context),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemCount: cubit.exclusive.length,
                     scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Best Seller',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'see All',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    child: ListView.separated(
                      //physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildProductItem(cubit.bestSeller[index],context),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemCount: cubit.bestSeller.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Groceries',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'see All',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 120,
                    child: ListView.separated(
                      //physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildCate(cubit.groceries[index],index,context),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemCount: cubit.groceries.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 250,
                    child: ListView.separated(
                      //physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildProductItem(cubit.protin[index],context),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemCount: cubit.protin.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          );
        }
        );
  }
  Widget buildCate(Cate model,index,context)=>Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color:OnlineCubit.get(context).containerColor[index],
    ),
    width: 300,
    child:Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image(image:AssetImage(model.image!)),
          const SizedBox(width: 20,),
          Text(model.name!,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
    ),
  );
}
