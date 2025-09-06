import 'package:evencir_test/core/api/api_state.dart';
import 'package:evencir_test/core/api/models/api_base_paginated_model.dart';
import 'package:evencir_test/core/api/models/deserializable.dart';
import 'package:evencir_test/core/widgets/app_api_consumer.dart';
import 'package:evencir_test/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppApiPaginatedConsumer<
  B extends StateStreamable<ApiState<ApiBasePaginatedModel<D>>>,
  D extends Deserializable
>
    extends StatefulHookWidget {
  const AppApiPaginatedConsumer({
    super.key,
    this.listener,
    required this.itemsBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    required this.onLoadMore,
    required this.onRefresh,
    this.loadExisting = true,
  });

  final void Function(
    BuildContext context,
    ApiState<ApiBasePaginatedModel<D>> state,
    List<D> listData,
  )?
  listener;
  final Widget Function(
    BuildContext context,
    ApiState<ApiBasePaginatedModel<D>> state,
    List<D> listData,
  )
  itemsBuilder;
  final Widget Function(
    BuildContext context,
    ApiState<ApiBasePaginatedModel<D>> state,
  )?
  emptyBuilder;
  final Widget Function(
    BuildContext context,
    ApiState<ApiBasePaginatedModel<D>> state,
  )?
  errorBuilder;
  final void Function(BuildContext context, int skip) onLoadMore;
  final void Function(BuildContext context, int skip) onRefresh;
  final bool loadExisting;

  @override
  State<AppApiPaginatedConsumer<B, D>> createState() =>
      AppApiPaginatedConsumerState<B, D>();
}

class AppApiPaginatedConsumerState<
  B extends StateStreamable<ApiState<ApiBasePaginatedModel<D>>>,
  D extends Deserializable
>
    extends State<AppApiPaginatedConsumer<B, D>> {
  int skip = 0;
  final int limit = 10; // you can make it configurable
  List<D> dataList = [];
  bool hasMore = false;

  Future<void> refresh() async {
    dataList = [];
    skip = 0;
    widget.onRefresh.call(context, skip);
  }

  @override
  void initState() {
    if (widget.loadExisting) {
      final existingState = context.read<B>().state;
      if (existingState is ApiLoadedState<ApiBasePaginatedModel<D>>) {
        dataList.addAll(existingState.data.data);
        hasMore = existingState.data.total != dataList.length;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refresh(),
      child: NotificationListener(
        onNotification: (notification) {
          if (!hasMore) return false;

          if (dataList.isEmpty) return false;

          if (notification is ScrollEndNotification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
              skip += limit;
              widget.onLoadMore.call(context, skip);
            }
          }
          return false;
        },
        child: AppApiConsumer<B, ApiBasePaginatedModel<D>>(
          listener: (p0, p1) {
            if (p1 is ApiLoadedState<ApiBasePaginatedModel<D>>) {
              final data = p1.data;
              hasMore = data.total != dataList.length;
              if (dataList.isEmpty) {
                dataList = data.data;
              } else {
                dataList.addAll(data.data);
              }
            }

            widget.listener?.call(p0, p1, dataList);
          },
          successBuilder: (context, state) {
            if (dataList.isEmpty) {
              if (widget.emptyBuilder == null) {
                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: const Center(child: Text('No Data Available')),
                    ),
                  ],
                );
              } else {
                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: widget.emptyBuilder!(context, state),
                    ),
                  ],
                );
              }
            }

            return widget.itemsBuilder(context, state, dataList);
          },
          errorBuilder: widget.errorBuilder,
          emptyBuilder: widget.emptyBuilder,
          loadingBuilder: (context, state) {
            // Show loading for first time
            if (state is ApiLoadingState && dataList.isEmpty) {
              return const LoadingWidget();
            }

            return widget.itemsBuilder(context, state, dataList);
          },
        ),
      ),
    );
  }
}
