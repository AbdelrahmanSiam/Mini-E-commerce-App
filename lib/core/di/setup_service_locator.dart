import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mini_ecommerce/core/services/api_server.dart';
import 'package:mini_ecommerce/core/services/local_storage_service.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:mini_ecommerce/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mini_ecommerce/features/auth/domain/repo/auth_repo.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/register_use_case/register_use_case.dart';
import 'package:mini_ecommerce/features/auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'package:mini_ecommerce/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:mini_ecommerce/features/products/data/repo/products_repo_impl.dart';
import 'package:mini_ecommerce/features/products/domain/repo/products_repo.dart';
import 'package:mini_ecommerce/features/products/domain/use_cases/fetch_products_use_case.dart';
import 'package:mini_ecommerce/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LocalStorageService>(LocalStorageService());

  // Auth
  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localStorageService: getIt<LocalStorageService>(),
    ),
  );
  getIt.registerFactory<LoginUseCase>(
    () => LoginUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerFactory<RegisterUseCase>(
    () => RegisterUseCase(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
    ),
  );
    // ── Products ──────────────────────────────────────────────
  getIt.registerSingleton<ProductsRemoteDataSource>(
    ProductsRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(remoteDataSource: getIt<ProductsRemoteDataSource>()),
  );
  getIt.registerFactory<FetchProductsUseCase>(
    () => FetchProductsUseCase(productsRepo: getIt<ProductsRepo>()),
  );
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(fetchProductsUseCase: getIt<FetchProductsUseCase>()),
  );
}
