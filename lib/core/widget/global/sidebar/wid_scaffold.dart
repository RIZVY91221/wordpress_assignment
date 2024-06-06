import 'package:bs_assignment/core/widget/global/modal/app_modal.dart';
import 'package:bs_assignment/environment/build_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold(
      {Key? key,
      required this.body,
      this.showDefaultDrawer = false,
      this.drawer,
      this.appBar,
      this.backgroundColor,
      this.padding = EdgeInsets.zero,
      this.onWillPopScope,
      this.onWillPop,
      this.onWillPopData,
      this.width,
      this.height,
      this.widthFactorCenter,
      this.heightFactorCenter,
      this.bottomNavigationBar})
      : super(key: key);

  final Widget body;
  final double? width;
  final double? height;
  final double? widthFactorCenter;
  final double? heightFactorCenter;
  final bool showDefaultDrawer;
  final bool? onWillPopScope;
  final Function()? onWillPop;
  final Object? onWillPopData;
  final Drawer? drawer;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final Widget? bottomNavigationBar;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final Logger logger = BuildConfig.instance.envVariables.logger;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.onWillPop != null) {
          // When onWillPop method is invoking
          logger.i('◁◁ |wpm:1| ↩︎ onWillPop(){...}');
          widget.onWillPop?.call();
        } else if (widget.onWillPopData != null) {
          // When Has Payload
          logger.i('◁◁ |wpm:2| ↩︎ onWillPopData()');
          Get.back(result: widget.onWillPopData);
        } else if (widget.onWillPopScope != null) {
          // If not null will return the true (pop)/false (not pop)
          logger.i('◁◁ |wpm:3| ↩︎ onWillPopScope()');
          return widget.onWillPopScope!;
        } else if (Get.currentRoute.isNotEmpty) {
          logger.i('◁◁ |wpm:4| ↩︎ SystemNavigator.pop()');
          ConfirmationModal.show(
              onPressed: () => SystemNavigator.pop(), header: 'Exit App', content: 'Are you sure to exit Fulfilment App?');
          return false;
        } else {
          // Default Pop State
          logger.i('◁◁ |wpm:5| ↩︎ AppNavigate.pop()');
          Get.back();
        }
        // Default Return
        return false;
      },
      child: Scaffold(
        appBar: widget.appBar,
        drawer: widget.drawer,
        backgroundColor: widget.backgroundColor,
        bottomNavigationBar: widget.bottomNavigationBar,
        body: SafeArea(
          child: Center(
            widthFactor: widget.widthFactorCenter,
            heightFactor: widget.heightFactorCenter,
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: Padding(
                padding: widget.padding,
                child: widget.body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
