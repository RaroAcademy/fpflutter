import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.empty() = HomeStateEmpty;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.success(List<String> names) = HomeStateSuccess;
  const factory HomeState.error([String? message]) = HomeStateError;
}
