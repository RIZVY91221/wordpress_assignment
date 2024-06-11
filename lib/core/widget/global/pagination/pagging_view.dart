import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/widget/global/loading/wid_loading_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagingView<T> extends StatelessWidget {
  const PagingView(
      {super.key,
      required this.pagingController,
      required this.itemBuilder,
      this.onRefresh,
      this.isSeparator = true,
      this.isGridView = false});
  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Future<void>? onRefresh;
  final bool isSeparator;
  final bool isGridView;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () =>
          onRefresh ??
          Future.sync(
            () => pagingController.refresh(),
          ),
      child: !isGridView
          ? PagedListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, int int) => isSeparator
                  ? const Divider(
                      height: 0.0,
                      thickness: 0.5,
                    )
                  : const SizedBox.shrink(),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<T>(
                firstPageProgressIndicatorBuilder: (context) => const WidgetLoadingSkeleton(
                  pageState: PageState.LOADING,
                  rows: 4,
                ),
                newPageProgressIndicatorBuilder: (context) => const WidgetLoadingSkeleton(
                  pageState: PageState.LOADING,
                  rows: 4,
                ),
                noItemsFoundIndicatorBuilder: (context) => AppIcon.noData(top: MediaQuery.of(context).size.height / 3),
                itemBuilder: (context, item, index) => itemBuilder(context, item, index),
              ))
          : PagedGridView(
              pagingController: pagingController,
              showNewPageProgressIndicatorAsGridChild: false,
              showNewPageErrorIndicatorAsGridChild: false,
              showNoMoreItemsIndicatorAsGridChild: false,
              shrinkWrap: true,
              builderDelegate: PagedChildBuilderDelegate<T>(
                firstPageProgressIndicatorBuilder: (context) => const WidgetLoadingSkeleton(
                  pageState: PageState.LOADING,
                  rows: 4,
                ),
                newPageProgressIndicatorBuilder: (context) => const WidgetLoadingSkeleton(
                  pageState: PageState.LOADING,
                  rows: 4,
                ),
                noItemsFoundIndicatorBuilder: (context) => AppIcon.noData(top: MediaQuery.of(context).size.height / 3),
                itemBuilder: (context, item, index) => itemBuilder(context, item, index),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 100 / 120,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
            ),
    );
  }
}
