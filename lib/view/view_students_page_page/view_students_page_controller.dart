import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/view_page_item.dart';


class ViewStudentsPageController extends GetxController {

  navigate(String value) {
    String route = '';
    switch(value) {
      case ViewPageItem.play:
        route = classPlayPage;
        break;
      case ViewPageItem.kg:
        route = classKgPage;
        break;
      case ViewPageItem.nursery:
        route = classNurseryPage;
        break;
      case ViewPageItem.className1:
        route = class1Page;
        break;
      case ViewPageItem.className2:
        route = class2Page;
        break;
      case ViewPageItem.className3:
        route = class3Page;
        break;
      case ViewPageItem.className4:
        route = class4Page;
        break;
      case ViewPageItem.className5:
        route = class5Page;
        break;
      case ViewPageItem.className6:
        route = class6Page;
        break;
      case ViewPageItem.className7:
        route = class7Page;
        break;
      case ViewPageItem.className8:
        route = class8Page;
        break;
      case ViewPageItem.className9:
        route = class9Page;
        break;
      case ViewPageItem.className10:
        route = class10Page;
        break;
    }
    return route;
  }

}
