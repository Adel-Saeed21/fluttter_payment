import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:payment/Features/checkout/domain/use_case/payment_strip_use_case.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_cubit.dart';
import 'package:payment/core/Payment/strip/stripe_service.dart';
import 'package:payment/core/networking/dio_factory.dart';
import 'package:payment/core/networking/network_service.dart';

var getIt = GetIt.instance;
void initCore() {
  if (getIt.isRegistered<PaymentCubit>()) return;
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<NetworkService>(() => NetworkServiceImp());
  getIt.registerLazySingleton<StripeService>(
    () => StripeService(networkService: getIt()),
  );
  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(getIt<StripeService>()),
  );
  getIt.registerLazySingleton<PaymentStripUseCase>(
    () => PaymentStripUseCase(getIt()),
  );

  getIt.registerFactory<PaymentCubit>(
    () => PaymentCubit(getIt<PaymentStripUseCase>()),
  );
}
