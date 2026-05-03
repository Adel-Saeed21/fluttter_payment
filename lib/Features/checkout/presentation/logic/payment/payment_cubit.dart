import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/domain/use_case/payment_strip_use_case.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentStripUseCase) : super(PaymentInitialState());
  final PaymentStripUseCase paymentStripUseCase;

  Future makePayment({required String amount, required String currency}) async {
    emit(PaymentLoadingState());

    final result = await paymentStripUseCase(
      amount: amount,
      currency: currency,
    );

    result.when(
      onSuccess: (data) {
        emit(PaymentSuccessState());
      },
      onError: (error) {
        emit(PaymentErrorState(error.toString()));
      },
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
