
import 'package:ble_test/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'bluetooth_off.dart';
import 'find_devices.dart';

class DevicesPage extends StatelessWidget {
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('BLE Devices'),
      ),
      body: GetX<MainController>(
          builder: (controller) {
            final state = controller.bleStatus.value;
            if (state == BluetoothState.on) {
              return FindDevices();
            }
            return BluetoothOff(state: state);
          }),
    );
  }
}
