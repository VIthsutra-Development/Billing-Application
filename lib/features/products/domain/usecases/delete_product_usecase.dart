import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/products/domain/repository/product_repository.dart';

class DeleteProductUsecase implements Usecase<String, DeleteProductParams> {
  final ProductRepository productRepository;
  DeleteProductUsecase({
    required this.productRepository,
  });
  @override
  Future<Either<Failure, String>> call(DeleteProductParams params) async {
    return await productRepository.deleteProduct(
      productId: params.productId,
    );
  }
}

class DeleteProductParams {
  final String productId;
  DeleteProductParams({
    required this.productId,
  });
}
