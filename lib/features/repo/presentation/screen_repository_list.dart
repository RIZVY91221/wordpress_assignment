import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:flutter/material.dart';

class RepositoryListScreen extends StatelessWidget {
  const RepositoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppText.headline6("Repository List", color: AppColor.whiteFFFFFF),
      ),
      body: const Center(
        child: Text("Repo List"),
      ),
    );
  }
}
