library permissions_wrapper;

import 'package:bruno/bruno.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsWrapper {

  static Future<bool> requestPermission(Permission permission,BuildContext context) async {
    PermissionStatus status = await permission.request();
    if (status != PermissionStatus.granted) {
      _showDialog(context);
    }
    return status == PermissionStatus.granted;
  }


  static _showDialog(BuildContext context, {String message = '权限获取失败，是否前往设置'}) {
    return BrnDialogManager.showConfirmDialog(context,
        title: "温馨提示",
        cancel: '取消',
        confirm: '确定',
        message: message, onConfirm: () {
      openAppSettings();
    }, onCancel: () {
      Navigator.of(context).pop();
    });
  }
}
