import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:multi_split_view/multi_split_view.dart';

class HomeController extends GetxController {
  RxString data = ''.obs;

  String initData = '''
# h1 Heading
Irure pariatur eu esse culpa qui non consequat labore irure voluptate fugiat. Id reprehenderit pariatur id nisi nisi eiusmod ipsum ipsum laborum incididunt ullamco. Reprehenderit adipisicing cupidatat reprehenderit do elit nulla veniam. Reprehenderit fugiat nostrud aliquip non sit eu adipisicing minim dolor aliquip exercitation minim.

## h2 Heading
Ad amet Lorem enim minim. Deserunt commodo cillum reprehenderit incididunt eiusmod ex ea sit laborum enim exercitation. Eu consectetur nisi fugiat esse id ullamco nostrud irure reprehenderit ullamco ipsum sunt elit. Fugiat commodo sit est sint mollit eu enim cillum pariatur anim exercitation culpa amet. Tempor elit quis reprehenderit duis ex sunt ea proident nulla id non reprehenderit ea adipisicing.

### h3 Heading
Enim excepteur reprehenderit amet laborum magna reprehenderit. Elit sint sint quis in ullamco. Nulla voluptate esse amet in nostrud et veniam anim qui voluptate ullamco. Incididunt excepteur mollit veniam mollit labore culpa qui cillum et. In pariatur non sunt ullamco est voluptate dolor nostrud duis ex ea ea.
''';

  final textMarkdownController = TextEditingController();
  final MultiSplitViewController multiSplitViewController =
      MultiSplitViewController();

  final tocController = TocController();
  Widget buildTocWidget() => TocWidget(controller: tocController);

  @override
  void onInit() {
    super.onInit();
    initContent();
  }

  initContent() {
    data.value = initData;
    textMarkdownController.text = initData;

    multiSplitViewController.areas = [
      // Area(
      //   data: buildTocWidget(),
      //   flex: 1,
      // ),
      Area(
        data: TextFormField(
          controller: textMarkdownController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          maxLines: null,
          onChanged: (value) {
            data.value = value;
          },
        ),
        flex: 2,
      ),
      Area(
        data: Obx(
          () => MarkdownWidget(
            data: data.value,
            tocController: tocController,
          ),
        ),
        flex: 1,
      ),
    ];
  }
}
