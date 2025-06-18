import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/products/domain/entities/product_entity.dart';
import 'package:new_billing/features/products/domain/repository/product_repository.dart';

class FetchProductUsecase
    implements Usecase<List<ProductEntity>, FetchProductsParams> {
  final ProductRepository productRepository;
  FetchProductUsecase({required this.productRepository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      FetchProductsParams params) async {
    return await productRepository.getProducts();
  }
}

class FetchProductsParams {}
