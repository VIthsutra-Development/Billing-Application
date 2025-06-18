part of 'fetch_product_cubit.dart';

@immutable
sealed class FetchProductState {}

final class FetchProductInitial extends FetchProductState {}

final class FetchProductSuccessState extends FetchProductState {
  final List<ProductEntity> product;
  FetchProductSuccessState({required this.product});
}

final class FetchProductFailureState extends FetchProductState {
  final String message;
  FetchProductFailureState({required this.message});
}

final class FetchProductLoadingState extends FetchProductState{}