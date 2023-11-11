import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:taggame/kit/text/tg_text_style.dart';
import 'package:taggame/kit/tg_colors.dart';
import 'package:taggame/kit/tg_animations.dart';
import 'package:taggame/tg_page_mixin.dart';
import 'package:taggame/utils/throttler.dart';
import 'package:taggame/utils/vibrates.dart';

class BottomWideButton extends StatefulWidget {
  static final defaultInnerHorizontalPadding = 40.w;
  static final defaultInnerVerticalPadding = 24.5.h;
  static final loadingSize = 30.w;

  const BottomWideButton({
    super.key,
    this.leading,
    this.central,
    this.centralText,
    this.centralTextColor,
    this.trailing,
    this.onPressed,
    this.color,
    this.loading = false,
    this.loadingColor = TGColors.whiteColor,
    this.enabled = true,
    this.respectBottomSafeArea = true,
    this.throttlerDuration = const Duration(milliseconds: 300),
    this.borderSide = BorderSide.none,
    this.innerPadding,
    this.gradient,
    this.radius,
    this.shimmer = false,
  })  : assert(
          central == null || centralText == null,
          "Central and centralText can't be passed at one time",
        ),
        assert(centralTextColor == null || centralText != null,
            "centralTextColor can't be passed without centralText");

  factory BottomWideButton.secondary({
    Widget? leading,
    required String centralText,
    Widget? trailing,
    VoidCallback? onPressed,
  }) {
    return BottomWideButton(
      leading: leading,
      centralText: centralText,
      trailing: trailing,
      onPressed: onPressed,
      color: TGColors.blackOp90Color,
      centralTextColor: TGColors.whiteColor,
    );
  }

  final Widget? leading;
  final Widget? central;
  final String? centralText;
  final Color? centralTextColor;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final Color? color;
  final bool loading;
  final Color loadingColor;
  final bool enabled;
  final bool respectBottomSafeArea;
  final Duration throttlerDuration;
  final BorderSide borderSide;
  final EdgeInsets? innerPadding;
  final Gradient? gradient;
  final double? radius;
  final bool shimmer;

  @override
  BottomWideButtonState createState() => BottomWideButtonState();
}

class BottomWideButtonState extends State<BottomWideButton>
    with TGPageStateMixin {
  late Throttler _clickThrottler;

  @override
  void initState() {
    super.initState();
    _clickThrottler = Throttler(
      _onPressed,
      duration: widget.throttlerDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: widget.respectBottomSafeArea,
      child: AnimatedContainer(
        duration: TGAnimations.duration,
        curve: TGAnimations.onScreenCurve,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius ?? 43.r),
          gradient: widget.gradient,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Shimmer(
                duration: const Duration(milliseconds: 1500),
                interval: const Duration(milliseconds: 1000),
                color: TGColors.whiteColor,
                colorOpacity: 0.5,
                enabled: widget.shimmer,
                direction: const ShimmerDirection.fromLTRB(),
                child: Container(
                  height: 50,
                  width: 50,
                  color: widget.color ?? colors.accentColor,
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: widget.borderSide,
                    borderRadius: BorderRadius.circular(widget.radius ?? 43.r),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed:
                  widget.onPressed == null ? null : _clickThrottler.throttle,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //Visibility, а не Opacity из-за того что происходит куча перерисовок
                    Opacity(
                      opacity: widget.loading ? 1.0 : 0.0,
                      child: _loadingCenter(),
                    ),
                    Opacity(
                      opacity: widget.loading ? 0.0 : 1.0,
                      child: _notLoadingCenter(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loadingCenter() {
    return SizedBox(
      width: BottomWideButton.loadingSize,
      height: BottomWideButton.loadingSize,
      child: CircularProgressIndicator(
        strokeWidth: 4.w,
        valueColor: AlwaysStoppedAnimation<Color>(widget.loadingColor),
      ),
    );
  }

  Widget _notLoadingCenter() {
    return Padding(
      padding: widget.innerPadding ??
          EdgeInsets.symmetric(
            horizontal: BottomWideButton.defaultInnerHorizontalPadding,
            vertical: BottomWideButton.defaultInnerVerticalPadding,
          ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.leading != null) ...[
            widget.leading!,
            SizedBox(width: 9.w),
          ],
          widget.central ?? _centralText(),
          if (widget.trailing != null) ...[
            SizedBox(width: 3.w),
            widget.trailing!,
          ],
        ],
      ),
    );
  }

  Widget _centralText() {
    return Flexible(
      child: AnimatedDefaultTextStyle(
        duration: TGAnimations.duration,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToLastDescent: false,
          applyHeightToFirstAscent: false,
        ),
        style: TGTextStyle.instance.style17Semibold.copyWith(
          color: widget.centralTextColor ?? TGColors.whiteColor,
        ),
        child: Text(widget.centralText!),
      ),
    );
  }

  void _onPressed() {
    if (!widget.enabled) {
      return;
    }

    vibrateMedium();
    widget.onPressed?.call();
  }
}
