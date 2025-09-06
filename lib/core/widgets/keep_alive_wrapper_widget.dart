import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeepAliveWrapper extends HookWidget {
  final Widget child;
  const KeepAliveWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // enables AutomaticKeepAliveClientMixin behavior
    useAutomaticKeepAlive();

    return child;
  }
}
