part of 'HomeCubit.dart';

class HomeState {
  final HomeStatus status;
  HomeState({this.status = HomeStatus.initial});
}

enum HomeStatus {
  initial, loading, error, success
}
ValueNotifier<bool> isAccountDeleting = ValueNotifier(false);