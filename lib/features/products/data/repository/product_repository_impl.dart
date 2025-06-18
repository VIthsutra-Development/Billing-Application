import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/features/products/data/datasource/product_local_datasource.dart';
import 'package:new_billing/features/products/data/datasource/product_remote_datasource.dart';
import 'package:new_billing/features/products/data/models/product_model.dart';
import 'package:new_billing/features/products/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDatasource productLocalDatasource;
  final ProductRemoteDatasource productRemoteDatasource;
  ProductRepositoryImpl({
    required this.productLocalDatasource,
    required this.productRemoteDatasource,
  });
  @override
  Future<Either<Failure, String>> addProduct({
    required String productName,
    required String productHsn,
    required String productQty,
    required String productUnit,
    required String productRate,
  }) async {
    try {
      final invoiceId = productLocalDatasource.getInvoiceId();
      final response = await productRemoteDatasource.addProduct(
        productDetails: ProductModel(
            invoiceId: invoiceId,
            productHsn: productHsn,
            productId: "",
            productName: productName,
            productQuantity: productQty,
            productRate: productRate,
            productUnit: productUnit,
            total: ""),
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } on LocalStorageException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } catch (_) {
      return Left(
        Failure(
          message: "Exception While Processing The Request.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> deleteProduct({
    required String productId,
  }) async {
    try {
      final response = await productRemoteDatasource.deleteProducts(
        productId: productId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          message: "Exception While Processing The Request.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final invoiceId = productLocalDatasource.getInvoiceId();
      final response = await productRemoteDatasource.fetchProducts(
        invoiceId: invoiceId,
      );
      return Right(response);
    } on LocalStorageException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          message: "Exception While Communicating With The Server.",
        ),
      );
    }
  }
}
