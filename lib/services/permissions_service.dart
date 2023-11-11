import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:taggame/log.dart';
import 'package:taggame/services/navigator/router_service.dart';

const _tag = 'permissions_service';

class PermissionsService {
  PermissionsService() {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }

  Future<bool> hasPushPermission() async {
    final status = await Permission.notification.status;
    return status == PermissionStatus.granted;
  }

  Future<bool> softRequestPermission({
    required String title,
    required String permissionRationale,
    required Permission permission,
  }) async {
    PermissionStatus status = await permission.status;
    Log.d(_tag, 'softRequestPermission: $permission status = $status');
    if (status == PermissionStatus.granted) {
      return true;
    }

    if (await permission.shouldShowRequestRationale) {
      Log.d(_tag, 'softRequestPermission: show rationale dialog');

      await _showPermissionSettingsDialog(
        title: title,
        permissionRationale: permissionRationale,
        settingsMode: false,
      );
    }

    Log.d(_tag, 'softRequestPermission:: request permission');
    status = await permission.request();

    Log.d(
      _tag,
      'softRequestPermission: after request $permission status = $status',
    );
    return status == PermissionStatus.granted;
  }

  Future<bool> hardRequestPermission({
    required String title,
    required String permissionRationale,
    required Permission permission,
  }) async {
    PermissionStatus status = await permission.status;
    Log.d(_tag, 'hardRequestPermission: $permission status = $status');
    if (status == PermissionStatus.granted) {
      return true;
    }

    if (await permission.shouldShowRequestRationale) {
      Log.d(_tag, 'hardRequestPermission: show rationale dialog');

      await _showPermissionSettingsDialog(
        title: title,
        permissionRationale: permissionRationale,
        settingsMode: false,
      );
    }

    if (status == PermissionStatus.restricted ||
        status == PermissionStatus.limited ||
        status == PermissionStatus.permanentlyDenied) {
      Log.d(_tag, 'hardRequestPermission: show settings dialog');

      await _showPermissionSettingsDialog(
        title: title,
        permissionRationale: permissionRationale,
        settingsMode: true,
      );

      status = await permission.status;
      Log.d(_tag,
          'hardRequestPermission: after settings $permission status = $status');
      return status == PermissionStatus.granted;
    }

    Log.d(_tag, 'hardRequestPermission: request permission');
    status = await permission.request();

    // https://github.com/Baseflow/flutter-permission-handler/issues/902
    if (Platform.isAndroid &&
        status == PermissionStatus.permanentlyDenied &&
        permission == Permission.notification) {
      Log.d(_tag, 'hardRequestPermission: show settings dialog');

      await _showPermissionSettingsDialog(
        title: title,
        permissionRationale: permissionRationale,
        settingsMode: true,
      );

      status = await permission.status;
    }

    Log.d(
      _tag,
      'hardRequestPermission: after request $permission status = $status',
    );
    return status == PermissionStatus.granted;
  }

  Future<void> _showPermissionSettingsDialog({
    required String title,
    required String permissionRationale,
    required bool settingsMode,
  }) async {
    final context = RouterService.navigatorKey.currentContext;
    if (context == null) return;

    await PermissionSettingsDialogRoute(
      title: title,
      permissionRationale: permissionRationale,
      settingsMode: settingsMode,
    ).push(context);
  }
}
