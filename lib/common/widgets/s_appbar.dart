import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

class SAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? centerTitle, backPress;
  final List<Widget>? actions;

  const SAppbar({Key? key, this.title, this.centerTitle, this.backPress, this.actions}) : super(key: key);

  @override
  State<SAppbar> createState() => _SAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(7.h);
}

class _SAppbarState extends State<SAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Utils.color('pbg'),
      centerTitle: widget.centerTitle,
      leading: widget.backPress!=null && widget.backPress! ? _leading() : const SizedBox(),
      leadingWidth: widget.backPress ?? false ? 8.w :  0,
      title: Text(
        widget.title ?? "",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      elevation: 0,
      actions: widget.actions,
    );
  }

  _leading() {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
