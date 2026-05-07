import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/domain/use_case/payment_paymob_use_case.dart';
import 'package:payment/Features/checkout/domain/use_case/payment_strip_use_case.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_state.dart';
enum PaymentMethod { stripe, paymob }

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentStripUseCase, this.paymentPaymobUseCase) 
      : super(PaymentInitialState());
  
  final PaymentStripUseCase paymentStripUseCase;
  final PaymentPaymobUseCase paymentPaymobUseCase;

  Future makePayment({
    required String amount,
    required String currency,
    required PaymentMethod method,
  }) async {
    emit(PaymentLoadingState());

    switch (method) {
      case PaymentMethod.stripe:
        final result = await paymentStripUseCase(amount: amount, currency: currency);
        result.when(
          onSuccess: (_) => emit(PaymentSuccessState()),
          onError: (e) => emit(PaymentErrorState(e.toString())),
        );
        break;

      case PaymentMethod.paymob:
        final result = await paymentPaymobUseCase();
        result.when(
          onSuccess: (_) => emit(PaymentSuccessState()),
          onError: (e) => emit(PaymentErrorState(e.toString())),
        );
        break;
    }
  }
}