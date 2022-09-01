import 'package:get/get.dart';

import '../../../../core/services/api/endpoints.dart';

class MenuRepository extends GetConnect {
  Future<dynamic> getVendorMenu() async {
    final Response response = await get(menuRoute,
    headers: {}
    );
  }
}
