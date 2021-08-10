import 'package:flutter/material.dart';
import 'package:fpflutter/home/home_repository.dart';
import 'package:fpflutter/home/home_state.dart';

class HomeController {
  final HomeRepository repository;

  final stateNotifier = ValueNotifier<HomeState>(HomeStateEmpty());
  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  HomeController({
    required this.repository,
  });

  Future<void> getNames() async {
    final response = await this.repository.getNames();
    state = response.fold(
      (l) => HomeStateError(l),
      (r) => HomeStateSuccess(r),
    );
  }
}
