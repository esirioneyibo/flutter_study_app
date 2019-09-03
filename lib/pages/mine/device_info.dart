import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';

class DeviceInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // e.g. "iPod
    getDeviceInfo();
    return Scaffold(
      appBar:
          ReturnBar(MyLocalizations.of(context).deviceInfo),
      body: Center(
        child:
            Text(MyLocalizations.of(context).aboutSoftware),
      ),
    );
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.model}');
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo =
          await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');
    } else {
      print('神特么设备无法识别');
    }
  }
}
