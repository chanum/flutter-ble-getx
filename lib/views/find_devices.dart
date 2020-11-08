
import 'package:ble_test/views/scan_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_devices_controller.dart';
import '../controllers/devices_controller.dart';

class FindDevices extends StatelessWidget {
  final devicesController = Get.put(DevicesController());
  final addDevicesController = Get.put(AddDevicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
//      appBar: AppBar(
//        backgroundColor: Colors.lightBlue,
//        title: Text('BLE Devices'),
//      ),
      body: SafeArea(
        child: Column(
          children: [
            GetX<DevicesController>(
                builder: (controller) {
                return Expanded(
                  child: ListView.builder(
                        itemCount: controller.discoverDevices.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: controller.discoverDevices
                                .map(
                                  (r) => ScanResultTile(
                                result: r,
                                onTap: () => Get.snackbar('New device', 'Device: X', snackPosition: SnackPosition.BOTTOM)
                              ),
                            ).toList(),
                          );
                  }),
                );
              }
            ),
            GetX<AddDevicesController>(
              builder: (controller) {
                return Text(
                  'Added devices: ${controller.totalDevices}',
                  style: TextStyle(fontSize: 26, color: Colors.white),
                );
              },
            ),
            RaisedButton(
                onPressed: () {
                  // Get.snackbar('New device added', 'Device: X',
                  //     snackPosition: SnackPosition.BOTTOM);

                  //Get.to(AboutPage(), arguments: 'Chanum');

                  Get.find<DevicesController>().scanDevices();
                },
                color: Colors.orange,
                textColor: Colors.white,
                child: Text('Scan')),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}