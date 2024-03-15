import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString data = ''.obs;

  String initData = '''
# h1 Heading
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
###### h6 Heading
  ''';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data.value = initData;
  }
}
