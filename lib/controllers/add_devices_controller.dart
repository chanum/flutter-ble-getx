import 'package:ble_test/models/device_model.dart';
import 'package:get/get.dart';

class AddDevicesController extends GetxController {
  var addedDevices = List<DeviceModel>().obs;
  int get totalDevices => addedDevices.length;

  addDevice(DeviceModel device) {
    addedDevices.add(device);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
