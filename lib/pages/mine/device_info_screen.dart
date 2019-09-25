import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i18n/localization_intl.dart';
import 'package:flutter_study_app/utils/navigator_util.dart';

class DeviceInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        NavigatorUtil.back(context, details);
      },
      child: Scaffold(
        appBar: ReturnBar(MyLocalizations.of(context).deviceInfo),
        body: FutureBuilder(
          future: getDeviceInfo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('waiting.....'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<DataRow> rows = List();
              Map<String, String> info = snapshot.data;
              info.forEach((key, value) {
                rows.add(DataRow(cells: [
                  DataCell(Text(
                    key,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  DataCell(Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                ]));
              });

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(columns: [
                  DataColumn(label: Text('标识')),
                  DataColumn(label: Text('内容')),
                ], rows: rows),
              );
            } else {
              return Center(
                child: Text('error'),
              );
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, String>> getDeviceInfo() async {
    Map<String, String> info = Map();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      info['系统版本'] = iosInfo.model;
      info['唯一识别码'] = iosInfo.identifierForVendor;
      info['名字'] = iosInfo.name;
      info['运行类型'] = iosInfo.runtimeType.toString();
      info['系统名字'] = iosInfo.systemName;
      info['utsname'] = iosInfo.utsname.toString();
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      info['系统版本'] = androidInfo.model;
      info['android Id'] = androidInfo.androidId;
      info['主板'] = androidInfo.board;
      info['启动版本号'] = androidInfo.bootloader.toString();
      info['系统制造商'] = androidInfo.brand;
      info['设备参数'] = androidInfo.device.toString();
      info['显示屏参数'] = androidInfo.display.toString();
      info['唯一识别码'] = androidInfo.fingerprint.toString();
      info['硬件名字'] = androidInfo.hardware.toString();
      info['硬件制造商'] = androidInfo.manufacturer.toString();
      info['产品名字'] = androidInfo.product.toString();
      info['是否是物理机'] = androidInfo.isPhysicalDevice.toString();
      info['构建标签'] = androidInfo.tags.toString();
      info['固件版本'] = androidInfo.version.toString();
      info['支持的abis'] = androidInfo.supportedAbis.toString();
      info['支持的64位apibs'] = androidInfo.supported64BitAbis.toString();
      info['支持的32位abis'] = androidInfo.supported32BitAbis.toString();
      info['固件版本'] = androidInfo.version.toString();
    } else {
      print('神特么设备无法识别');
    }
    return info;
  }
}
