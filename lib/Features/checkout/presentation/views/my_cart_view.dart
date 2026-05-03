import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/widgets/my_cart_body.dart';
import 'package:payment/core/dependency_injection/init_core.dart';
import 'package:payment/core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart View", style: Styles.style25),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: MyCartBody(),
        ),
      ),
    );
  }
}
