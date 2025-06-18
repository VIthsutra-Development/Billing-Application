part of 'delete_product_cubit.dart';

@immutable
sealed class DeleteProductState {}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductSuccessState extends DeleteProductState {
  final String message;
  DeleteProductSuccessState({required this.message});
}

final class DeleteProductFailureState extends DeleteProductState{
  final String message;
  DeleteProductFailureState({required this.message});
}

final class DeleteProductLoadingState extends DeleteProductState{}