part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependancies() async {
  await _initHive();
  _initAuth();
  _initHistory();
  _initLogistic();
  _initCustomer();
  _initBank();
  _initFirm();
  _initHome();
  _initProduct();
  _initBilling();
  serviceLocator.registerLazySingleton(() => Connection());
  serviceLocator.registerLazySingleton(() => http.Client());
}

Future<void> _initHive() async {
  final appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  final Box<String> box = await Hive.openBox("user_details");
  serviceLocator.registerLazySingleton(() => box);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
        box: serviceLocator(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authLocalDataSource: serviceLocator(),
        authRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => LoginUsecase(
        authRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => RegisterUsecase(
        authRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AutoLoginUsecase(
        authRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ForgotPassUsecase(
        authRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => OtpUsecase(authRepository: serviceLocator()))
    ..registerFactory(
      () => AuthBloc(
          loginUsecase: serviceLocator(),
          registerUsecase: serviceLocator(),
          forgotPassUsecase: serviceLocator(),
          otpUsecase: serviceLocator()),
    )
    ..registerFactory(
      () => AutoLoginCubit(
        autoLoginUsecase: serviceLocator(),
      ),
    );
}

void _initHistory() {
  serviceLocator
    ..registerFactory<HistoryRemoteDataSource>(
      () => HistoryRemoteDataSourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<HistoryLocalDataSource>(() => HistoryLocalDataSourceImpl(
          box: serviceLocator(),
        ))
    ..registerLazySingleton<HistoryRepository>(
      () => HistoryRepositoryImpl(
        historyLocalDataSource: serviceLocator(),
        historyRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchHistoryUsecase(
        historyRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteInvoiceUsecase(
        historyRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => UpdatePaymentStatusUsecase(
        historyRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => HistoryBloc(
        fetchHistoryUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteInvoiceCubit(
        deleteInvoiceUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => PaymentStatusUpdaterCubit(
        updatePaymentStatusUsecase: serviceLocator(),
      ),
    );
}

void _initLogistic() {
  serviceLocator
    ..registerFactory<LogisticRemoteDataSource>(
      () => LogisticRemoteDataSourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<LogisticLocalDataSource>(
        () => LogisticLocalDataSourceImpl(
              box: serviceLocator(),
            ))
    ..registerLazySingleton<LogisticRepository>(
      () => LogisticRepositoryImpl(
        logisticLocalDataSource: serviceLocator(),
        logisticRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchLogisticUsecase(
        logisticRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteLogisticUsecase(
        logisticRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AddLogisticUsecase(
        logisticRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchLogisticCubit(
        fetchLogisticUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteLogisticCubit(
        deleteLogisticUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddLogisticCubit(
        addLogisticUsecase: serviceLocator(),
      ),
    );
}

void _initCustomer() {
  serviceLocator
    ..registerFactory<CustomerRemoteDataSource>(
      () => CustomerRemoteDataSourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<CustomerLocalDatasource>(
        () => CustomerLocalDatasourceImpl(
              box: serviceLocator(),
            ))
    ..registerLazySingleton<CustomerRepository>(
      () => CustomerRepositoryImpl(
        customerLocalDataSource: serviceLocator(),
        customerRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchCustomerUsecase(
        customerRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteCustomerUsecase(
        customerRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AddCustomerUsecase(
        customerRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchCustomerCubit(
        fetchCustomerUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteCustomerCubit(
        deleteCustomerUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddCustomerCubit(
        addCustomerUsecase: serviceLocator(),
      ),
    );
}

void _initBank() {
  serviceLocator
    ..registerFactory<BankRemoteDataSource>(
      () => BankRemoteDataSourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<BankLocalDataSource>(() => BankLocalDataSourceImpl(
          box: serviceLocator(),
        ))
    ..registerLazySingleton<BankRepository>(
      () => BankRepositoryImpl(
        bankLocalDataSource: serviceLocator(),
        bankRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchBankUsecase(
        bankRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteBankUsecase(
        bankRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AddBankUsecase(
        bankRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchBankCubit(
        fetchBankUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteBankCubit(
        deleteBankUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddBankCubit(
        addBankUsecase: serviceLocator(),
      ),
    );
}

void _initFirm() {
  serviceLocator
    ..registerFactory<FirmRemoteDataSource>(
      () => FirmRemoteDataSourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<FirmLocalDataSource>(() => FirmLocalDataSourceImpl(
          box: serviceLocator(),
        ))
    ..registerLazySingleton<FirmRepository>(
      () => FirmRepositoryImpl(
        firmLocalDataSource: serviceLocator(),
        firmRemoteDataSource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchFirmUsecase(
        firmRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteFirmUsecase(
        firmRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AddFirmUsecase(
        firmRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchFirmCubit(
        fetchFirmUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteFirmCubit(
        deleteFirmUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddFirmCubit(
        addFirmUsecase: serviceLocator(),
      ),
    );
}

void _initHome() {
  serviceLocator
    ..registerFactory<HomeLocalDatasource>(
      () => HomeLocalDatasourceImpl(
        box: serviceLocator(),
      ),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        homeLocalDatasource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => LogoutUsecase(
        homeRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => LogoutCubitCubit(
        logoutUsecase: serviceLocator(),
      ),
    );
}

void _initProduct() {
  serviceLocator
    ..registerFactory<ProductRemoteDatasource>(
      () => ProductRemoteDatasourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<ProductLocalDatasource>(() => ProductLocalDatasourceImpl(
          box: serviceLocator(),
        ))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(
        productLocalDatasource: serviceLocator(),
        productRemoteDatasource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchProductUsecase(
        productRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => DeleteProductUsecase(
        productRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AddProductUsecase(
        productRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchProductCubit(
        fetchProductUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => DeleteProductCubit(
        deleteProductUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddProductCubit(
        addProductUsecase: serviceLocator(),
      ),
    );
}

void _initBilling() {
  serviceLocator
    ..registerFactory<BillingRemoteDatasource>(
      () => BillingRemoteDatasourceImpl(
        client: serviceLocator(),
        connection: serviceLocator(),
      ),
    )
    ..registerFactory<BillingLocalDatasource>(() => BillingLocalDatasourceImpl(
          box: serviceLocator(),
        ))
    ..registerLazySingleton<BillingRepository>(
      () => BillingRepositoryImpl(
        billingLocalDatasource: serviceLocator(),
        billingRemoteDatasource: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchCustomerUsecases(
        billingRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchLogisticsUsecases(
        billingRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchFirmsUsecases(
        billingRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FetchBanksUsecases(
        billingRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SubmitInvoiceUsecases(
        billingRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchFirmCubits(
        fetchFirmsUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchCustomerCubits(
        fetchCustomerUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchBankCubits(
        fetchBankUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => FetchLogisticCubits(
        fetchLogisticsUsecase: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SubmitInvoiceCubit(submitInvoiceUsecase: serviceLocator()),
    );
}
