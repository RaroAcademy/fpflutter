import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpflutter/home/home_controller.dart';
import 'package:fpflutter/home/home_state.dart';
import 'package:fpflutter/home/repositories/home_repository.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_test.mocks.dart';

void main() {
  late HomeController controller;
  late HomeRepository repository;
  setUp(() {
    repository = MockHomeRepository();
    controller = HomeController(repository: repository);
  });

  group("Test-HomeController", () {
    test("GetNames - Success", () async {
      final names = ["A"];
      when(repository.getNames())
          .thenAnswer((realInvocation) => Future.value(right(names)));
      final matcher = [HomeState.loading(), HomeState.success(names)];
      final actual = <HomeState>[];
      controller.stateNotifier.addListener(() {
        actual.add(controller.state);
      });
      await controller.getNames();
      expect(actual, matcher);
    });

    test("GetNames - Error", () async {
      final message = "Deu ruim";
      when(repository.getNames())
          .thenAnswer((_) => Future.value(left(message)));
      final matcher = [HomeState.loading(), HomeState.error(message)];
      final actual = <HomeState>[];
      controller.stateNotifier.addListener(() {
        actual.add(controller.state);
      });
      await controller.getNames();
      expect(actual, matcher);
    });
  });
}
