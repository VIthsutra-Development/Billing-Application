import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/exceptions.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/widgets/app_dropdown.dart';
import 'package:new_billing/features/billing/data/datasource/billing_local_datasource.dart';
import 'package:new_billing/features/billing/data/datasource/billing_remote_datasource.dart';
import 'package:new_billing/features/billing/data/models/billing_model.dart';
import 'package:new_billing/features/billing/domain/repository/billing_repository.dart';

class BillingRepositoryImpl implements BillingRepository {
  final BillingLocalDatasource billingLocalDatasource;
  final BillingRemoteDatasource billingRemoteDatasource;
  BillingRepositoryImpl({
    required this.billingLocalDatasource,
    required this.billingRemoteDatasource,
  });
  @override
  Future<Either<Failure, List<DropDownElements>>> fetchBanks() async {
    try {
      final userId = billingLocalDatasource.getUserId();
      final response = await billingRemoteDatasource.getBanks(userId: userId);
      return Right(response);
    } on ServerException catch (e) {
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
  Future<Either<Failure, List<DropDownElements>>> fetchCustomer() async {
    try {
      final userId = billingLocalDatasource.getUserId();
      final response = await billingRemoteDatasource.getCustomers(
        userId: userId,
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
          message: "Exception While Communicating With The Server.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<DropDownElements>>> fetchFirm() async {
    try {
      final userId = billingLocalDatasource.getUserId();
      final firms = await billingRemoteDatasource.getFirms(
        userId: userId,
      );
      return Right(firms);
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
    } catch (e) {
      return Left(
        Failure(
          message: "Exception While Communicating With The Server.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<DropDownElements>>> fetchLogistic() async {
    try {
      final userId = billingLocalDatasource.getUserId();
      final logistics = await billingRemoteDatasource.getLogistics(
        userId: userId,
      );
      return Right(logistics);
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
          message: "Exception While Communication With The Server.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> submitInvoice({
    required String billNo,
    required String billName,
    required String stateCode,
    required String vehicleNumber,
    required String challanNumber,
    required String dateOfSupply,
    required String placeOfSupply,
    required String state,
    required String reverseCharge,
    required String firmId,
    required String logisticId,
    required String bankId,
    required String customerId,
  }) async {
    try {
      final userId = billingLocalDatasource.getUserId();
      final response = await billingRemoteDatasource.submitBillingForm(
        billingDetails: BillingModel(
          billName: billName,
          billNumber: billNo,
          challanNumber: challanNumber,
          customer: customerId,
          dateOfSupply: dateOfSupply,
          firm: firmId,
          logistic: logisticId,
          place: placeOfSupply,
          reverseCharge: reverseCharge,
          state: state,
          stateCode: stateCode,
          vehicleNumber: vehicleNumber,
          userId: userId,
          bankId: bankId,
        ),
      );
      final res = billingLocalDatasource.addInvoiceId(invoiceId: response);
      return Right(res);
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
    } catch (e) {
      return Left(
        Failure(
          message: "Exception While Communicating With The Server.",
        ),
      );
    }
  }
}
