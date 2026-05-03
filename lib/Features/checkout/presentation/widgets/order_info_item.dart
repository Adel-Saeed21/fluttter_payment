import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.productName,
    required this.price,
  });
  final String productName;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(productName, style: Styles.style18),
        Spacer(),
        Text(price, style: Styles.style18),
      ],
    );
  }
}
