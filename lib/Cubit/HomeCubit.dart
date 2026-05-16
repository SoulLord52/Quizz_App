import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part "HomeState.dart";

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> deleteAccount({required Function onDeleted}) async {
    isAccountDeleting.value = true;
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        isAccountDeleting.value = false;
        onDeleted();
      }
    } catch (e) {
      isAccountDeleting.value = false;
    }
  }
}