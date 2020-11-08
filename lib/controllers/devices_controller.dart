import 'package:ble_test/models/device_model.dart';
import 'package:get/state_manager.dart';

class DevicesController extends GetxController {
  var devices = List<DeviceModel>().obs;

  @override
  void onInit() {
    super.onInit();
    discoverDevices();
  }

  void discoverDevices() async {
    await Future.delayed(Duration(seconds: 2));
    var deviceResult = [
      DeviceModel(id: 1, name: 'Oxymeter'),
      DeviceModel(id: 2, name: 'Heart Rate'),
      DeviceModel(id: 3, name: 'Blood Pressure')
    ];

    devices.value = deviceResult;
  }
}
