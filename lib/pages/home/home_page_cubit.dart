import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taggame/di.dart';
import 'package:taggame/log.dart';
import 'package:taggame/pages/home/home_page_cubit_state.dart';
import 'package:taggame/services/localization_service.dart';
import 'package:taggame/services/permissions_service.dart';

const _tag = 'home_page_cubit';

class HomePageCubit extends Cubit<HomePageCubitState> {
  HomePageCubit()
      : _localizationService = di.get(),
        _permissionsService = di.get(),
        super(
          HomePageCubitState((b) => b),
        ) {
    _init();
  }

  final LocalizationService _localizationService;
  final PermissionsService _permissionsService;

  Future<void> _init() async {
    Log.d(_tag, '_init');
  }

  Future<bool> requestPermissions() async {
    final localization = await _localizationService.getLocalization();

    final bluetooth = await _permissionsService.hardRequestPermission(
      title: localization.permissionTitle,
      permissionRationale: localization.permissionSubtitle,
      permission: Permission.bluetooth,
    );

    Log.d(_tag, 'requestPermissions: bluetooth = $bluetooth');
    if (!bluetooth) return false;

    final bluetoothConnect = await _permissionsService.hardRequestPermission(
      title: localization.permissionTitle,
      permissionRationale: localization.permissionSubtitle,
      permission: Permission.bluetoothConnect,
    );

    Log.d(
      _tag,
      'requestPermissions: bluetoothConnect = $bluetoothConnect',
    );
    if (!bluetoothConnect) return false;

    final bluetoothAdvertise = await _permissionsService.hardRequestPermission(
      title: localization.permissionTitle,
      permissionRationale: localization.permissionSubtitle,
      permission: Permission.bluetoothAdvertise,
    );

    Log.d(_tag, 'requestPermissions: bluetoothAdvertise = $bluetoothAdvertise');
    if (!bluetoothAdvertise) return false;

    final bluetoothScan = await _permissionsService.hardRequestPermission(
      title: localization.permissionTitle,
      permissionRationale: localization.permissionSubtitle,
      permission: Permission.bluetoothScan,
    );

    Log.d(_tag, 'requestPermissions: bluetoothScan = $bluetoothScan');
    if (!bluetoothScan) return false;

    final location = await _permissionsService.hardRequestPermission(
      title: localization.permissionTitle,
      permissionRationale: localization.permissionSubtitle,
      permission: Permission.location,
    );

    Log.d(_tag, 'requestPermissions: location = $location');
    if (!location) return false;

    final locationWhenInUse = await _permissionsService.hardRequestPermission(
      title: localization.permissionTitle,
      permissionRationale: localization.permissionSubtitle,
      permission: Permission.locationWhenInUse,
    );

    Log.d(_tag, 'requestPermissions: locationWhenInUse = $locationWhenInUse');
    if (!locationWhenInUse) return false;

    final activityRecognition = await _permissionsService.hardRequestPermission(
      title: localization.permissionTitle,
      permissionRationale: localization.permissionSubtitle,
      permission: Permission.activityRecognition,
    );

    Log.d(
      _tag,
      'requestPermissions: activityRecognition = $activityRecognition',
    );

    if (!activityRecognition) return false;

    return true;
  }
}
