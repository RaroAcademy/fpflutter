import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<String, List<String>>> getNames();
}
