import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

class SButton extends StatefulWidget {
  final Function onTap;
  final String label;
  final EdgeInsets? padding, margin;
  final TextStyle? style;
  final Color? backgroundColor;

  const SButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.padding,
    this.margin,
    this.style,
    this.backgroundColor,
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
          width: 60.w,
          height: 7.h,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Utils.color('pb'),
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
          ),
          alignment: Alignment.center,
          child: Text(widget.label,
              style: widget.style ?? TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500, color: Utils.color("st"))),
        ),
      ),
    );
  }
}
