import 'package:ble_test/models/device_model.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/state_manager.dart';

class DevicesController extends GetxController {

  Stream<List<ScanResult>> _flutterBlueResult = FlutterBlue.instance.scanResults;

  var devices = List<DeviceModel>().obs;

  @override
  void onInit() {
    super.onInit();
    discoverDevices();

    _flutterBlueResult.listen((scanList) {
      print('BLE Scan Result List: $scanList');
    });

  }

  void discoverDevices() async {
    await Future.delayed(Duration(seconds: 2));
    var deviceResult = [
      DeviceModel(id: 1, name: 'Oximeter'),
      DeviceModel(id: 2, name: 'Heart Rate'),
      DeviceModel(id: 3, name: 'Blood Pressure')
    ];

    devices.value = deviceResult;
  }

  void scanDevices() {
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));
  }
}
