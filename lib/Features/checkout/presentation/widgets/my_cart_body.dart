import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/logic/payment/payment_state.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Cart Items ──────────────────────────
          const Text(
            "Your items",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _buildCartItem(
            "Nike Air Max",
            "Size 42 · Qty 1",
            "\$120.00",
            Icons.shopping_bag,
          ),
          const SizedBox(height: 8),
          _buildCartItem(
            "Sony Headphones",
            "Black · Qty 1",
            "\$80.00",
            Icons.headphones,
          ),

          const SizedBox(height: 16),

          // ── Order Summary ────────────────────────
          _buildSummaryCard(),

          const SizedBox(height: 16),

          // ── Payment Methods ──────────────────────
          const Text(
            "Payment method",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _buildPaymentCard(context),

          const SizedBox(height: 20),

          // ── Pay Button ───────────────────────────
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
                            amount: "20500", // cents
                            currency: "usd",
                            
                          );
                        },
                  child: state is PaymentLoadingState
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Pay with Stripe — \$205.00",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ── Helpers ─────────────────────────────────────

  Widget _buildCartItem(String name, String sub, String price, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.blue.shade400),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  sub,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _summaryRow("Subtotal", "\$200.00"),
          _summaryRow("Shipping", "\$5.00"),
          const Divider(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const Text(
                "\$205.00",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF185FA5),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          Text(value, style: const TextStyle(fontSize: 13)),
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
            onTap: () {},
          ),
          const Divider(height: 0.5, indent: 14),
          _paymentMethodTile(
            icon: Icons.account_balance_wallet,
            iconBg: const Color(0xFFE8F4FD),
            iconColor: Colors.blue,
            name: "PayPal",
            desc: "onPressed: null",
            badgeText: "Soon",
            badgeBg: const Color(0xFFF1EFE8),
            badgeColor: Colors.grey,
            onTap: null,
          ),
          const Divider(height: 0.5, indent: 14),
          // Paymob — معطّل
          _paymentMethodTile(
            icon: Icons.payments,
            iconBg: const Color(0xFFEAFAF1),
            iconColor: Colors.green,
            name: "Paymob",
            desc: "onPressed: null",
            badgeText: "Soon",
            badgeBg: const Color(0xFFF1EFE8),
            badgeColor: Colors.grey,
            onTap: null,
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
    required VoidCallback? onTap,
  }) {
    return Opacity(
      opacity: onTap == null ? 0.45 : 1.0,
      child: ListTile(
        onTap: onTap,
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
            const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
          ],
        ),
      ),
    );
  }
}
