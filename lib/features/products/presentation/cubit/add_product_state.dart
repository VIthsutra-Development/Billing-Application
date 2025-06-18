part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductSuccessState extends AddProductState {
  final String message;
  AddProductSuccessState({required this.message});
}

final class AddProductFailureState extends AddProductState {
  final String message;
  AddProductFailureState({required this.message});
}

final class AddProductLoadingState extends AddProductState{}