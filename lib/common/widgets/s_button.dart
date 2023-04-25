import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

class SButton extends StatefulWidget {
  final Function onTap;
  final String label;
  final EdgeInsets? padding, margin;
  final TextStyle? style;

  const SButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.padding,
    this.margin,
    this.style,
  }) : super(key: key);

  @override
  State<SButton> createState() => _SButtonState();
}

class _SButtonState extends State<SButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      child: Container(
        margin: widget.margin ?? Utils.screenPadding(),
        padding: widget.padding ?? Utils.contentPadding(),
        width: 80.w,
        height: 7.h,
        decoration: BoxDecoration(
          color: Utils.color('pb'),
          borderRadius: BorderRadius.all(Radius.circular(2.w)),
        ),
        child: Text(widget.label, style: widget.style ?? TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
