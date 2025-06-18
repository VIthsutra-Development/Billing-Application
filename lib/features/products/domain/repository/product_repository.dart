import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/products/domain/entities/product_entity.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, String>> deleteProduct({
    required String productId,
  });
  Future<Either<Failure, String>> addProduct({
    required String productName,
    required String productHsn,
    required String productQty,
    required String productUnit,
    required String productRate,
  });
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
