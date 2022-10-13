import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/modules/shop/shop.dart';
import 'package:online_groceries/shared/base_cubit/cubit.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';
import 'package:online_groceries/shared/components/components.dart';

class ProductDetails extends StatelessWidget {
  var model;
  ProductDetails({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnlineCubit, OnlineStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnlineCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20)),
                      height: 250,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 20,
                              left: 20,
                              child: IconButton(
                                  onPressed: () {
                                    navigateTo(context, const Shop());
                                  },
                                  icon: const Icon(Icons.arrow_back_ios))),
                          const Positioned(
                              top: 31, right: 30, child: Icon(Icons.ios_share)),
                          Center(
                            child: Image(
                              image: AssetImage(model.image!),
                              fit: BoxFit.cover,
                              height: 150,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          model.name,
                          style: const TextStyle(
                              fontFamily: 'Jannah', fontSize: 20),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    Text(
                      model.size,
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cubit.minusCounter();
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[100],
                          ),
                          width: 60,
                          height: 50,
                          child: Center(
                            child: Text(
                              '${cubit.currentCounter}',
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cubit.addCounter();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          model.price,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Colors.grey[100],
                      child: ExpansionTile(
                        title: const Text(
                          'Product Detail',
                          style: TextStyle(
                              fontFamily: 'Jannah',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              model.description,
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontFamily: 'Jannah',
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Nutritions',
                          style: TextStyle(fontFamily: 'Jannah', fontSize: 20),
                        ),
                        const Spacer(),
                        Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(model.size),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Review',
                          style: TextStyle(fontFamily: 'Jannah', fontSize: 20),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    defButton(
                      function: () {},
                      text: 'Add To Basket',
                      isUpper: false,
                      heigth: 67,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
