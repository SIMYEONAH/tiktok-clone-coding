import 'package:flutter/material.dart';

import '../../../../constants/gaps.dart';
import '../../../../constants/sizes.dart';

class DashboardScreen extends StatelessWidget {
  final String number;
  final String title;

  const DashboardScreen({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v3,
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
