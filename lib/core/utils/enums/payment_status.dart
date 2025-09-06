import 'package:flutter/material.dart';

enum PaymentStatus {
  pending('pending'),
  processing('processing'),
  completed('completed'),
  failed('failed'),
  refunded('refunded');

  const PaymentStatus(this.value);

  factory PaymentStatus.fromString(String status) {
    return PaymentStatus.values.firstWhere(
      (e) => e.value == status.toLowerCase(),
      orElse: () => PaymentStatus.pending,
    );
  }
  final String value;

  String get displayName {
    switch (this) {
      case PaymentStatus.pending:
        return 'Pending';
      case PaymentStatus.processing:
        return 'Processing';
      case PaymentStatus.refunded:
        return 'Refunded';
      case PaymentStatus.completed:
        return 'Completed';
      case PaymentStatus.failed:
        return 'Failed';
    }
  }

  Color get color {
    switch (this) {
      case PaymentStatus.pending:
        return Colors.orange;
      case PaymentStatus.processing:
        return Colors.blue;
      case PaymentStatus.refunded:
        return Colors.red;
      case PaymentStatus.completed:
        return Colors.purple;
      case PaymentStatus.failed:
        return Colors.grey;
    }
  }
}
