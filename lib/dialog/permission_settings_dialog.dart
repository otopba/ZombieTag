import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taggame/kit/text/wd_text_style.dart';
import 'package:taggame/log.dart';
import 'package:taggame/tg_page_mixin.dart';

const _tag = 'permission_settings_dialog';

class PermissionSettingsDialog extends StatefulWidget {
  const PermissionSettingsDialog({
    super.key,
    required this.title,
    required this.permissionRationale,
    required this.settingsMode,
  });

  final String title;
  final String permissionRationale;
  final bool settingsMode;

  @override
  State<PermissionSettingsDialog> createState() =>
      _PermissionSettingsDialogState();
}

class _PermissionSettingsDialogState extends State<PermissionSettingsDialog>
    with TGPageStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Container(
              padding: EdgeInsets.all(20.w),
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xFF181721),
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TGTextStyle.instance.styleH4.copyWith(
                      color: colors.primaryTextColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    widget.permissionRationale,
                    textAlign: TextAlign.center,
                    style: TGTextStyle.instance.style22.copyWith(
                      color: colors.secondaryTextColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: _onOkPressed,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.r,
                            horizontal: 16.r,
                          ),
                          child: Text(
                            widget.settingsMode
                                ? localizations.settings
                                : localizations.ok.toUpperCase(),
                            style: TGTextStyle.instance.style24.copyWith(
                              color: colors.accentColor,
                            ),
                          ),
                        ),
                      ),
                      if (widget.settingsMode) ...[
                        SizedBox(width: 10.w),
                        OutlinedButton(
                          onPressed: _onCancelPressed,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 6.r,
                              horizontal: 16.r,
                            ),
                            child: Text(
                              localizations.cancel,
                              style: TGTextStyle.instance.style24.copyWith(
                                color: colors.secondaryTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onOkPressed() {
    Log.d(_tag, '_onOkPressed');

    Navigator.pop(context);

    if (widget.settingsMode) {
      Log.d(_tag, '_onOkPressed: openAppSettings');
      openAppSettings();
    }
  }

  void _onCancelPressed() {
    Log.d(_tag, '_onCancelPressed');

    Navigator.pop(context);
  }
}
