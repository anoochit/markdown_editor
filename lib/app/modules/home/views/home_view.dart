import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:multi_split_view/multi_split_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final textMarkdownController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // set
    textMarkdownController.text = controller.data.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MD Book'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        surfaceTintColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: MultiSplitView(
        dividerBuilder:
            (axis, index, resizable, dragging, highlighted, themeData) =>
                Container(
          color: dragging ? Colors.grey[800] : Colors.grey[100],
          child: Icon(
            Icons.drag_indicator_outlined,
            color: highlighted ? Colors.grey[600] : Colors.grey[400],
            size: 8.0,
          ),
        ),
        children: [
          // preview
          Container(
            child: Obx(
              () => MarkdownWidget(
                shrinkWrap: true,
                data: controller.data.value,
              ),
            ),
          ),

          // editor
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textMarkdownController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              maxLines: null,
              onChanged: (value) {
                updateMarkdown(text: value);
              },
            ),
          ),
        ],
      ),
    );
  }

  openFile() {}

  saveFile() {}

  updateMarkdown({required String text}) {
    controller.data.value = text;
  }
}
