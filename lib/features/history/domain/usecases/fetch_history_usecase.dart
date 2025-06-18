import 'package:dartz/dartz.dart';
import 'package:new_billing/core/failures/failure.dart';
import 'package:new_billing/core/usecase/usecase.dart';
import 'package:new_billing/features/history/domain/entities/history_entity.dart';
import 'package:new_billing/features/history/domain/repository/history_repository.dart';

class FetchHistoryUsecase
    implements Usecase<List<HistoryEntity>, FetchHistoryParams> {
  final HistoryRepository historyRepository;
  FetchHistoryUsecase({
    required this.historyRepository,
  });
  @override
  Future<Either<Failure, List<HistoryEntity>>> call(
    FetchHistoryParams params,
  ) async {
    return await historyRepository.getInvoices();
  }
}

class FetchHistoryParams {}
