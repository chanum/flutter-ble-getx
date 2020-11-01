import 'package:ble_test/models/device.dart';
import 'package:get/get.dart';

class AddDevicesController extends GetxController {
  var addedDevices = List<Device>().obs;
  int get totalDevices => addedDevices.length;

  addDevice(Device device) {
    addedDevices.add(device);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
