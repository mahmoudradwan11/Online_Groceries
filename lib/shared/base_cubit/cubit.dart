import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/models/Cate/cate.dart';
import 'package:online_groceries/models/Exclusive%20offers/exclusive.dart';
import 'package:online_groceries/modules/account/account.dart';
import 'package:online_groceries/modules/cart/cart.dart';
import 'package:online_groceries/modules/explore/explore.dart';
import 'package:online_groceries/modules/favorite/favorite.dart';
import 'package:online_groceries/modules/shop/shop.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';

class OnlineCubit extends Cubit<OnlineStates> {
  OnlineCubit() : super(InitOnlineState());
  static OnlineCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int currentCounter = 1;
  List<Widget> screens = const [
    Shop(),
    Explore(),
    Cart(),
    Favorite(),
    Account(),
  ];
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
    BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined), label: 'Explore'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), label: 'Favorite'),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_box_rounded), label: 'Account'),
  ];
  List<Exclusive> exclusive = [
    Exclusive(
        'images/bannana.png',
        'Organic Bananas',
        'Bananas are nutritious. Bananas may be good for weight loss. bananas may be good for your heart. As part of a healtful and varied diet.',
        '\$5.21',
        '1Kg'),
    Exclusive(
        'images/red parrer.png',
        'Bell Pepper Red',
        'Parrer are nutritious. Parrer may be good for weight loss. Perrer may be good for your heart. As part of a healtful and varied diet.',
        '\$4.99',
        '1kg'),
    Exclusive(
        'images/pngfuel.png',
        'Ginger',
        'Ginger are nutritious. Ginger may be good for weight loss. Ginger may be good for your heart. As part of a healtful and varied diet.',
        '\$3.12',
        '1kg'),
    Exclusive(
        'images/coke zero.png',
        'Diet Coke',
        'Diet Coke are nutritious. Diet Coke may be good for weight loss. Diet Coke may be good for your heart. As part of a healtful and varied diet.',
        '\$1.99',
        '330ml'),
  ];
  List<Exclusive> bestSeller = [
    Exclusive(
        'images/juice.png',
        'Apple Juice',
        'ApplesJuice are nutritious. ApplesJuice may be good for weight loss. applesJuice may be good for your heart. As part of a healtful and varied diet.',
        '\$15.99',
        '2L'),
    Exclusive(
        'images/pasta.png',
        'Pasta',
        'Pasta are nutritious. Pasta may be good for weight loss. Pasta may be good for your heart. As part of a healtful and varied diet.',
        '\$14.99',
        '300g'),
    Exclusive(
        'images/Mayonnaise.png',
        'Mayonnaise',
        'Mayonnaise are nutritious. Mayonnaise may be good for weight loss. Mayonnaise may be good for your heart. As part of a healtful and varied diet.',
        '\$3.12',
        '1kg'),
    Exclusive(
        'images/sprite.png',
        'Sprite',
        'Sprite are nutritious. Sprite may be good for weight loss. Sprite may be good for your heart. As part of a healtful and varied diet.',
        '\$3.12',
        '330ml'),
  ];
  List<Exclusive> protin = [
    Exclusive(
        'images/meet.png',
        'Beef Bone',
        'Beef Bone are nutritious. Beef Bone may be good for weight loss. Beef Bone may be good for your heart. As part of a healtful and varied diet.',
        '\$12.99',
        '1kg'),
    Exclusive(
        'images/chicken.png',
        'Chicken',
        'Chicken are nutritious. Chicken may be good for weight loss. Chicken may be good for your heart. As part of a healtful and varied diet.',
        '\$14.99',
        '1Kg'),
    Exclusive(
        'images/bread.png',
        'Bakery',
        'Bakery are nutritious. Bakery may be good for weight loss. Bakery may be good for your heart. As part of a healtful and varied diet.',
        '\$3.12',
        '1Kg'),
    Exclusive(
        'images/fish.png',
        'Fish',
        'Fish are nutritious. Fish may be good for weight loss. Fish may be good for your heart. As part of a healtful and varied diet.',
        '\$8.12',
        '1kg'),
    Exclusive(
        'images/oil.png',
        'Oil',
        'Oil are nutritious. Oil may be good for weight loss. Oil may be good for your heart. As part of a healtful and varied diet.',
        '\$8.12',
        '1L'),
  ];
  List<Color> containerColor = const [
    Color.fromRGBO(83, 177, 117, .6),
    Color.fromRGBO(248, 164, 76, .6),
    Color.fromRGBO(211, 176, 224, .6)
  ];
  List<Cate> groceries = [
    Cate('images/rasie.png', 'Pulses'),
    Cate('images/rice.png', 'Rice'),
    Cate('images/Beverages.png', 'Beverages'),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexScreenState());
  }

  void addCounter() {
    currentCounter++;
    emit(AddCounter());
  }

  void minusCounter() {
    currentCounter--;
    emit(MinusCounter());
  }
}
