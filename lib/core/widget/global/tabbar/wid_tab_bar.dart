import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:flutter/material.dart';

class CustomTabBar2 extends StatefulWidget {
  const CustomTabBar2({Key? key, required this.tabData, this.onChangeTabData, this.isContainerTabBar = false, this.initialTabData})
      : super(key: key);
  final TabData? initialTabData;
  final List<TabData> tabData;
  final bool isContainerTabBar;
  final Function(TabData)? onChangeTabData;

  @override
  State<CustomTabBar2> createState() => _CustomTabBar2State();
}

class _CustomTabBar2State extends State<CustomTabBar2> {
  String selectedItem = '';
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: widget.tabData
          .map((e) => GestureDetector(
              onTap: () {
                if (selectedIndex != e.index) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.onChangeTabData?.call(e);
                  setState(() {
                    selectedIndex = e.index;
                  });
                }
              },
              child: !widget.isContainerTabBar ? tabItem(e) : containerTabBarData(e)))
          .toList(),
    );
  }

  @override
  void initState() {
    selectedIndex = widget.initialTabData?.index ?? 0;
    super.initState();
  }

  Widget tabItem(TabData data) => Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p15),
        decoration: BoxDecoration(
            border: selectedIndex == data.index
                ? Border(
                    bottom: BorderSide(width: 1, color: selectedIndex == data.index ? AppColor.primaryOne4B9EFF : AppColor.whiteFFFFFF))
                : null),
        child: Text(
          data.title,
          style: TextStyle(
            color: selectedIndex == data.index ? AppColor.primaryOne4B9EFF : AppColor.whiteFFFFFF,
            fontSize: 14,
            fontWeight: selectedIndex == data.index ? FontWeight.w500 : FontWeight.w400,
            height: AppTextStyle.getHeight(16, 16),
          ),
        ),
      );

  Widget containerTabBarData(TabData data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: selectedIndex == data.index ? AppColor.primaryToneOneEAF4FF : AppColor.whiteLightestGrayF8F8F8,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Row(
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: selectedIndex == data.index ? FontWeight.w500 : FontWeight.w400,
                      color: selectedIndex == data.index ? AppColor.primaryOne4B9EFF : AppColor.darkLightest6C7576,
                      height: AppTextStyle.getHeight(12, 12),
                    ),
                  ),
                  data.content != null
                      ? Text(
                          "(${data.content})",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: selectedIndex == data.index ? FontWeight.w500 : FontWeight.w400,
                            color: selectedIndex == data.index ? AppColor.primaryOne4B9EFF : AppColor.darkLightest6C7576,
                            height: AppTextStyle.getHeight(12, 12),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      );
}

class TabData {
  int index;
  String title;
  String? content;

  TabData({required this.index, required this.title, this.content});
}
