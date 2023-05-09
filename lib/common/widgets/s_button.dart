import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

class SButton extends StatefulWidget {
  final Function onTap;
  final String label;
  final EdgeInsets? padding, margin;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final double? height, width, fontSize;
  final Widget? suffixWidget;

  const SButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.padding,
    this.margin,
    this.labelStyle,
    this.backgroundColor,
    this.height,
    this.width,
    this.fontSize,
    this.suffixWidget,
  }) : super(key: key);

  @override
  State<SButton> createState() => _SButtonState();
}

class _SButtonState extends State<SButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () => widget.onTap(),
        child: Container(
          padding: widget.padding ?? Utils.contentPadding(),
          width: widget.width ?? 60.w,
          height: widget.height ?? 7.h,
          decoration: BoxDecoration(
              color: widget.backgroundColor ?? Utils.color('pb'),
              borderRadius: BorderRadius.circular(10.w),
              border: Border.all(color: Utils.color('pt'))),
          alignment: Alignment.center,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.label,
                    style: widget.labelStyle ??
                        TextStyle(
                            fontSize: widget.fontSize ?? 18.sp, fontWeight: FontWeight.w500, color: Utils.color(""))),
                widget.suffixWidget ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
