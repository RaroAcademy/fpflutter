import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class HomeRepository {
  Future<Either<String, List<String>>> getNames();
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<Either<String, List<String>>> getNames() async {
    final client =
        Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
    try {
      final response = await client.get("/comments");
      final parse = (response.data as List).map((e) => e['name']).toList();
      return right(parse as List<String>);
    } catch (e) {
      return left("Deu ruim");
    }
  }
}
