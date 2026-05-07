import 'package:get_it/get_it.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:payment/Features/checkout/domain/use_case/payment_paymob_use_case.dart';
import 'package:payment/Features/checkout/domain/use_case/payment_strip_use_case.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_cubit.dart';
import 'package:payment/core/Payment/paymob/paymob_service.dart';
import 'package:payment/core/Payment/strip/stripe_service.dart';
import 'package:payment/core/networking/api_const.dart';
import 'package:payment/core/networking/network_service.dart';

var getIt = GetIt.instance;
void initCore() {
  if (getIt.isRegistered<PaymentCubit>()) return;
  // Stripe
  getIt.registerLazySingleton<NetworkService>(
    () => NetworkServiceImp(baseUrl: ApiConst.stripeBaseUrl),
    instanceName: 'stripe',
  );

  // Paymob
  getIt.registerLazySingleton<NetworkService>(
    () => NetworkServiceImp(baseUrl: ApiConst.paymobBaseUrl),
    instanceName: 'paymob',
  );

  getIt.registerLazySingleton<StripeService>(
    () => StripeService(networkService: getIt(instanceName: 'stripe')),
  );

  getIt.registerLazySingleton<PaymobService>(
    () => PaymobService(networkService: getIt(instanceName: 'paymob')),
  );
  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(getIt<StripeService>(), getIt<PaymobService>()),
  );
  getIt.registerLazySingleton<PaymentStripUseCase>(
    () => PaymentStripUseCase(getIt()),
  );

  getIt.registerLazySingleton<PaymentPaymobUseCase>(
  () => PaymentPaymobUseCase(getIt()),
);

getIt.registerFactory<PaymentCubit>(
  () => PaymentCubit(getIt<PaymentStripUseCase>(), getIt<PaymentPaymobUseCase>()),
);
}
