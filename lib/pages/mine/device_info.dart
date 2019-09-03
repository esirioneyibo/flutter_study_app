import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';
import 'package:flutter_study_app/i10n/localization_intl.dart';

class DeviceInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // e.g. "iPod
    var deviceInfo = getDeviceInfo();
    return Scaffold(
      appBar:
          ReturnBar(MyLocalizations.of(context).deviceInfo),
      body: Center(
        child: DataTable(columns: [
          DataColumn(label: Text('属性')),
          DataColumn(label: Text('值'))
        ], rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('2'))
          ]),
        ]),
      ),
    );
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('系统版本：model ${iosInfo.model}');
      print(
          '唯一识别码：identifierForVendor ${iosInfo.identifierForVendor}');
      print(
          'model：localizedModel ${iosInfo.localizedModel}');
      print('名字：name ${iosInfo.name}');
      print('运行类型：runtimeType ${iosInfo.runtimeType}');
      print('系统名字：systemName ${iosInfo.systemName}');
      print('系统版本：systemVersion ${iosInfo.systemVersion}');
      print('utsname：utsname ${iosInfo.utsname}');
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo =
          await deviceInfo.androidInfo;
      print('系统版本：${androidInfo.model}');
      print('id：androidId ${androidInfo.androidId}');
      print('主板：board ${androidInfo.board}');
      print('启动版本号：bootloader ${androidInfo.bootloader}');
      print('系统制造商：brand ${androidInfo.brand}');
      print('设备参数：device ${androidInfo.device}');
      print('显示屏参数：display ${androidInfo.display}');
      print(
          '唯一识别码：fingerprint ${androidInfo.fingerprint}');
      print('硬件名字：hardware ${androidInfo.hardware}');
      print('host：host ${androidInfo.host}');
      print(
          '是否是物理机：isPhysicalDevice ${androidInfo.isPhysicalDevice}');
      print(
          '硬件制造商：manufacturer ${androidInfo.manufacturer}');
      print('产品名字：product ${androidInfo.product}');
      print('构建标签：tags ${androidInfo.tags}');
      print('固件版本：version ${androidInfo.version}');
      print('类型：type ${androidInfo.type}');
      print(
          '支持的abis  supportedAbis ${androidInfo.supportedAbis}');
      print('支持的64位apibs  supported64BitAbis '
          '${androidInfo.supported64BitAbis}');
      print('支持的32位abis  supported32BitAbis '
          '${androidInfo.supported32BitAbis}');
    } else {
      print('神特么设备无法识别');
    }
  }
}
