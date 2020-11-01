import 'package:ble_test/models/device.dart';
import 'package:get/state_manager.dart';

class DevicesController extends GetxController {
  var devices = List<Device>().obs;

  @override
  void onInit() {
    super.onInit();
    discoverDevices();
  }

  void discoverDevices() async {
    await Future.delayed(Duration(seconds: 2));
    var deviceResult = [
      Device(id: 1, name: 'Oxymeter'),
      Device(id: 2, name: 'Heart Rate'),
      Device(id: 3, name: 'Blood Pressure')
    ];

    devices.value = deviceResult;
  }
}
