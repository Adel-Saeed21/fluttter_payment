import 'package:payment/Features/checkout/domain/repo/checkout_repo.dart';
import 'package:payment/core/networking/api_result.dart';

class PaymentPaymobUseCase {
  final CheckoutRepo repository;

  PaymentPaymobUseCase(this.repository);

  Future<ApiResult<void>> call() async {
    return await repository.makePaymentWithPaymob();
  }
}