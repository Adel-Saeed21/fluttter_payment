import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_state.dart';

class MyCartBody extends StatefulWidget {
  const MyCartBody({super.key});

  @override
  State<MyCartBody> createState() => _MyCartBodyState();
}

class _MyCartBodyState extends State<MyCartBody> {
  PaymentMethod _selectedMethod = PaymentMethod.stripe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ... باقي الكود
          _buildPaymentCard(context),

          // ── Pay Button
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Payment Successful!")),
                );
              } else if (state is PaymentErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF185FA5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: state is PaymentLoadingState
                      ? null
                      : () {
                          context.read<PaymentCubit>().makePayment(
                            amount: "20500",
                            currency: "usd",
                            method: _selectedMethod, // هنا بيبعت الاختيار
                          );
                        },
                  child: state is PaymentLoadingState
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Pay with ${_selectedMethod.name} — \$205.00",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _paymentMethodTile(
            icon: Icons.credit_card,
            iconBg: const Color(0xFFEEF2FF),
            iconColor: const Color(0xFF534AB7),
            name: "Stripe",
            desc: "Credit / Debit card",
            badgeText: "Ready",
            badgeBg: const Color(0xFFEAF3DE),
            badgeColor: const Color(0xFF3B6D11),
            isSelected: _selectedMethod == PaymentMethod.stripe,
            onTap: () => setState(() => _selectedMethod = PaymentMethod.stripe),
          ),
          const Divider(height: 0.5, indent: 14),
          _paymentMethodTile(
            icon: Icons.account_balance_wallet,
            iconBg: const Color(0xFFE8F4FD),
            iconColor: Colors.blue,
            name: "PayPal",
            desc: "Coming soon",
            badgeText: "Soon",
            badgeBg: const Color(0xFFF1EFE8),
            badgeColor: Colors.grey,
            isSelected: false,
            onTap: null,
          ),
          const Divider(height: 0.5, indent: 14),
          _paymentMethodTile(
            icon: Icons.payments,
            iconBg: const Color(0xFFEAFAF1),
            iconColor: Colors.green,
            name: "Paymob",
            desc: "Pay with Paymob",
            badgeText: "Ready",
            badgeBg: const Color(0xFFEAF3DE),
            badgeColor: const Color(0xFF3B6D11),
            isSelected: _selectedMethod == PaymentMethod.paymob,
            onTap: () => setState(() => _selectedMethod = PaymentMethod.paymob),
          ),
        ],
      ),
    );
  }

  Widget _paymentMethodTile({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String name,
    required String desc,
    required String badgeText,
    required Color badgeBg,
    required Color badgeColor,
    required bool isSelected,
    required VoidCallback? onTap,
  }) {
    return Opacity(
      opacity: onTap == null ? 0.45 : 1.0,
      child: ListTile(
        onTap: onTap,
        tileColor: isSelected ? Colors.blue.shade50 : null, 
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          desc,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: badgeBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badgeText,
                style: TextStyle(
                  fontSize: 10,
                  color: badgeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 4),
            // checkmark لو متاختار
            Icon(
              isSelected ? Icons.check_circle : Icons.chevron_right,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
