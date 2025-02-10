import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markdown Editor'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        surfaceTintColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: MultiSplitView(
        controller: controller.multiSplitViewController,
        dividerBuilder:
            (axis, index, resizable, dragging, highlighted, themeData) {
          return Container(
            color: Theme.of(context).colorScheme.inversePrimary.withAlpha(100),
            child: Icon(
              Icons.menu,
              size: 8.0,
            ),
          );
        },
        builder: (context, area) {
          return area.data;
        },
      ),
    );
  }

  updateMarkdown({required String text}) {
    controller.data.value = text;
  }
}
