import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

import '../models/device_model.dart';

class MainController extends GetxController {
  Stream<BluetoothState> flutterBlue = FlutterBlue.instance.state;
  var bleStatus = BluetoothState.unknown.obs;
  var devices = List<DeviceModel>().obs;

  @override
  void onInit() {
    super.onInit();
    flutterBlue.listen((value) {
      print('Value from controller: $value');
      bleStatus.value = value;
    });
  }
}