import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/products/domain/repository/product_repository.dart';

class AddProductUsecase implements Usecase<String, AddProductsParams> {
  final ProductRepository productRepository;
  AddProductUsecase({required this.productRepository});
  @override
  Future<Either<Failure, String>> call(AddProductsParams params) async {
    return await productRepository.addProduct(
      productName: params.productName,
      productHsn: params.productHsn,
      productQty: params.productQty,
      productUnit: params.productUnit,
      productRate: params.productRate,
    );
  }
}

class AddProductsParams {
  final String productName;
  final String productHsn;
  final String productQty;
  final String productUnit;
  final String productRate;
  AddProductsParams({
    required this.productHsn,
    required this.productName,
    required this.productQty,
    required this.productRate,
    required this.productUnit,
  });
}
