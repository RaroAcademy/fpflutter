import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpflutter/home/home_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late HomeRepository repository;
  setUp(() {
    repository = MockHomeRepository();
  });

  group("HomeRepository", () {
    test("Get Names - Success", () async {
      when(repository.getNames())
          .thenAnswer((realInvocation) => Future.value(right(["A"])));
      final response = await repository.getNames();
      expect(response.getOrElse(() => []).isNotEmpty, isTrue);
    });

    test("Get Names - Error", () async {
      when(repository.getNames())
          .thenAnswer((_) => Future.value(left("Deu ruim")));

      final response = await repository.getNames();
      final error = response.fold((l) => l, (r) => null);
      expect(error, "Deu ruim");
    });
  });
}
