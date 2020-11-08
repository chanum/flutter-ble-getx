import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';


class MainController extends GetxController {
  Stream<BluetoothState> _flutterBlueState = FlutterBlue.instance.state;
  var bleStatus = BluetoothState.unknown.obs;

  @override
  void onInit() {
    super.onInit();
    _flutterBlueState.listen((value) {
      print('BLE Status: $value');
      bleStatus.value = value;
    });
  }
}