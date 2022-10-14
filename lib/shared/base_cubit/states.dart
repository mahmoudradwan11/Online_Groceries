import 'package:online_groceries/shared/base_cubit/cubit.dart';

abstract class OnlineStates {}

class InitOnlineState extends OnlineStates {}

class ChangeIndexScreenState extends OnlineStates {}

class AddCounter extends OnlineStates {}

class MinusCounter extends OnlineStates {}

class CreateDatabaseState extends OnlineStates {}

class ErrorCreateDatabaseState extends OnlineStates {}

class InsertCartState extends OnlineStates {}

class ErrorInsertCartState extends OnlineStates {}

class GetCartState extends OnlineStates {}

class ErrorCartState extends OnlineStates {}

class InsertFavoriteState extends OnlineStates {}

class ErrorFavoriteInsertDataState extends OnlineStates {}

class GetFavoriteDataState extends OnlineStates {}

class ErrorGetFavoriteDataState extends OnlineStates {}

class DeleteCartDataState extends OnlineStates {}

class DeleteFavoriteDataState extends OnlineStates {}

class UserUpdateError extends OnlineStates {}

class UserUpdateLoading extends OnlineStates {}

class GetUserSuccessState extends OnlineStates {}

class GetUserErrorState extends OnlineStates {
  final String error;

  GetUserErrorState(this.error);
}
