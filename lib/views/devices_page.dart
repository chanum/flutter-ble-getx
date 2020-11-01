import 'dart:ui';

import 'package:ble_test/controllers/add_devices_controller.dart';
import 'package:ble_test/controllers/devices_controller.dart';
import 'package:ble_test/views/about_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicesPage extends StatelessWidget {
  final devicesController = Get.put(DevicesController());
  final addDevicesController = Get.put(AddDevicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('BLE Devices'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<DevicesController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.devices.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Device Id: ${controller.devices[index].id}',
                                      style: TextStyle(fontSize: 18)),
                                  Text(
                                      'Name: ${controller.devices[index].name}',
                                      style: TextStyle(fontSize: 18)),
                                ],
                              ),
                              RaisedButton(
                                  onPressed: () {
                                    addDevicesController
                                        .addDevice(controller.devices[index]);

                                    //Get.snackbar('New device added',
                                    //    'Device: ${controller.devices[index].name}',
                                    //  snackPosition: SnackPosition.BOTTOM);

                                    Get.defaultDialog(
                                        title: 'New device added',
                                        content: Text(
                                            'Device: ${controller.devices[index].name}'));
                                  },
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text('Add'))
                            ],
                          ),
                        ),
                      );
                    });
              }),
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
                  Get.to(AboutPage(), arguments: 'Chanum');
                },
                color: Colors.orange,
                textColor: Colors.white,
                child: Text('Next')),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
