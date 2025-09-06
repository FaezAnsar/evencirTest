import 'package:evencir_test/core/api/api_state.dart';
import 'package:evencir_test/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppApiConsumer<B extends StateStreamable<ApiState<T>>, T>
    extends StatelessWidget {
  const AppApiConsumer({
    super.key,
    this.listener,
    required this.successBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.rowLayout = false,
  });

  final void Function(BuildContext, ApiState<T>)? listener;
  final Widget Function(BuildContext context, ApiLoadedState<T> state)
  successBuilder;
  final Widget Function(BuildContext context, ApiState<T> state)? emptyBuilder;
  final Widget Function(BuildContext context, ApiLoadingState<T> state)?
  loadingBuilder;
  final Widget Function(BuildContext context, ApiErrorState<T> state)?
  errorBuilder;
  final bool rowLayout;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, ApiState<T>>(
      listener: (context, state) {
        listener?.call(context, state);
      },
      builder: (context, state) {
        if (state is ApiLoadingState<T>) {
          if (loadingBuilder != null) {
            return loadingBuilder!(context, state);
          } else {
            return const Center(child: LoadingWidget());
          }
        } else if (state is ApiLoadedState<T>) {
          return successBuilder(context, state);
        } else if (state is ApiErrorState<T>) {
          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverFillRemaining(
                child: Center(
                  child:
                      errorBuilder?.call(context, state) ??
                      Text(state.error.toString()),
                ),
              ),
            ],
          );
        } else {
          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverFillRemaining(
                child:
                    emptyBuilder?.call(context, state) ??
                    const Center(child: Text('No Data Available')),
              ),
            ],
          );
        }
      },
    );
  }
}
