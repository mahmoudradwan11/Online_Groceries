import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries/models/Cate/cate.dart';
import 'package:online_groceries/models/Exclusive%20offers/exclusive.dart';
import 'package:online_groceries/models/User/user.dart';
import 'package:online_groceries/modules/account/account.dart';
import 'package:online_groceries/modules/cart/cart.dart';
import 'package:online_groceries/modules/explore/explore.dart';
import 'package:online_groceries/modules/favorite/favorite.dart';
import 'package:online_groceries/modules/login/login.dart';
import 'package:online_groceries/modules/shop/shop.dart';
import 'package:online_groceries/shared/base_cubit/states.dart';
import 'package:online_groceries/shared/components/components.dart';
import 'package:online_groceries/shared/components/constants.dart';
import 'package:online_groceries/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

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
  List<Exclusive> beverages = [
    Exclusive(
        'images/coke zero.png',
        'Diet Coke',
        'Diet coke are nutritious. Diet coke may be good for weight loss. Diet coke may be good for your heart. As part of a healtful and varied diet.',
        '\$1.99',
        '330ml'),
    Exclusive(
        'images/sprite.png',
        'Sprite can',
        'Sprite are nutritious. Sprite may be good for weight loss. Sprite may be good for your heart. As part of a healtful and varied diet.',
        '\$1.50',
        '330ml'),
    Exclusive(
        'images/juice.png',
        'Apple Juice',
        'Apple Juice are nutritious. Apple Juice may be good for weight loss. Apple Juice may be good for your heart. As part of a healtful and varied diet.',
        '\$14.99',
        '2L'),
    Exclusive(
        'images/orange.png',
        'Orange Juice',
        'Orange Juice are nutritious. Orange Juice may be good for weight loss. Orange Juice may be good for your heart. As part of a healtful and varied diet.',
        '\$14.99',
        '2L'),
    Exclusive(
        'images/coca.png',
        'Coca can',
        'Coca  are nutritious. Coca may be good for weight loss. Coca may be good for your heart. As part of a healtful and varied diet.',
        '\$4.99',
        '330ml'),
    Exclusive(
        'images/pespi.png',
        'Pepsi',
        'Pepsi are nutritious. Pepsi may be good for weight loss. Pepsi may be good for your heart. As part of a healtful and varied diet.',
        '\$4.99',
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

  Database? database;
  List<Map> cart = [];
  List<Map> favorites = [];

  void createDatabase() {
    openDatabase('Online.db', version: 2, onCreate: (database, version) {
      print('DataBase Created');
      database
          .execute(
              'create table Cart(id INTEGER PRIMARY KEY,name TEXT , size TEXT , price TEXT,image TEXT)')
          .then((value) {
        print('Table 1 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
      database
          .execute(
              'create table Favorite(id INTEGER PRIMARY KEY,name TEXT , size TEXT , price TEXT,image TEXT)')
          .then((value) {
        print('Table 2 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getCartData(database);
      getFavoriteData(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    }).catchError((error) {
      emit(ErrorCreateDatabaseState());
    });
  }

  Future<void> insertCart(
      {required String name,
      required String size,
      required String price,
      required String image}) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Cart(name,size,price,image) VALUES("$name","$size","$price","$image")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertCartState());
        getCartData(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertCartState());
      });
    });
  }

  void getCartData(database) {
    cart = [];
    database!.rawQuery('select * from Cart').then((value) {
      value.forEach((element) {
        cart.add(element);
      });
      print(cart);
      emit(GetCartState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorCartState());
    });
  }

  void deleteCartData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Cart WHERE id= ?', [id]).then((value) {
      getCartData(database);
      emit(DeleteCartDataState());
    });
  }

  Future<void> insertFavorite(
      {required String name,
      required String size,
      required String price,
      required String image}) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Favorite(name,size,price,image) VALUES("$name","$size","$price","$image")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertFavoriteState());
        getFavoriteData(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorFavoriteInsertDataState());
      });
    });
  }

  void getFavoriteData(database) {
    favorites = [];
    database!.rawQuery('select * from Favorite').then((value) {
      value.forEach((element) {
        favorites.add(element);
      });
      print(favorites);
      emit(GetFavoriteDataState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetFavoriteDataState());
    });
  }

  void deleteFavoriteData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Favorite WHERE id= ?', [id]).then((value) {
      getFavoriteData(database);
      emit(DeleteFavoriteDataState());
    });
  }

  UserData? userModel;
  String? name;
  String? email;
  String? image;
  void updateUser({
    required String name,
  }) {
    emit(UserUpdateLoading());
    UserData model = UserData(
      name: name,
      email: userModel!.email,
      image: image ?? userModel!.image,
      uid: userModel!.uid,
    );
    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel!.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UserUpdateError());
    });
  }

  void getUserData() {
    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserData.fromJson(value.data()!);
      name = userModel!.name;
      image = userModel!.image;
      email = userModel!.email;
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUserErrorState(error.toString()));
    });
  }

  void signOut(context) {
    CacheHelper.removeData(key: 'uId').then((value) {
      if (value) {
        navigateAndFinish(context, Login());
      }
    });
  }
}
