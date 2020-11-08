import 'package:ble_test/models/device_model.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/state_manager.dart';

class DevicesController extends GetxController {

  Stream<List<ScanResult>> _flutterBlueResult = FlutterBlue.instance.scanResults;
  final discoverDevices = List<ScanResult>().obs;

  @override
  void onInit() {
    super.onInit();

    _flutterBlueResult.listen((scanList) {
      print('BLE Scan Result List: $scanList');
      discoverDevices.clear();
      discoverDevices.assignAll(scanList);
    });

  }

  void scanDevices() {
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));
  }
}
