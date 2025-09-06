import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    this.dimension,
    this.loadingStroke,
    this.color,
    super.key,
  });

  final double? dimension;
  final double? loadingStroke;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension ?? 32.w,
        child: AspectRatio(
          aspectRatio: 1,
          child: CircularProgressIndicator(
            color: color ?? Theme.of(context).colorScheme.primary,
            strokeWidth: loadingStroke ?? 2.0.w,
            strokeCap: StrokeCap.round,
          ),
        ),
      ),
    );
  }
}
