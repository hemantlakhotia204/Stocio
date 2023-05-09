import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/common/widgets/s_button.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool _isSortOn = false;
  Widget? _switcherWidget;

  final List<Map<String, dynamic>> _categories = [
    {"label": "Music", "icon": Icons.music_note_rounded},
    {"label": "Technology", "icon": Icons.computer_rounded},
    {"label": "Sports", "icon": Icons.sports_esports_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    _getSwitcherWidget();
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: Utils.screenPadding(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Category',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SButton(
                width: 30.w,
                height: 5.h,
                padding: EdgeInsets.zero,
                backgroundColor: _isSortOn ? Utils.color('pb').withOpacity(0.16) : Utils.color('sbg'),
                onTap: () => setState(() => _isSortOn = !_isSortOn),
                label: 'Sort  ',
                labelStyle:
                    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Utils.color(_isSortOn ? 'pb' : 'pt')),
                suffixWidget: Icon(Icons.sort_rounded, color: Utils.color(_isSortOn ? 'pb' : 'pt'), size: 20.sp),
              )
            ],
          ),
          SizedBox(height: 2.h),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            // transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
            child: _switcherWidget,
          ),
        ],
      ),
    );
  }

  _eventCard() {
    return Container(
      height: 20.h,
      padding: Utils.contentPadding(),
      margin: EdgeInsets.only(bottom: 2.h, left: 1.h, right: 1.h),
      decoration: BoxDecoration(
        color: Utils.color('sbg'),
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(color: Utils.color('border')),
      ),
      child: Column(
        children: [],
      ),
    );
  }

  _getSwitcherWidget() {
    _switcherWidget = _isSortOn
        ? GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 2.h,
            crossAxisSpacing: 4.h,
            childAspectRatio: 13 / 16,
            physics: const NeverScrollableScrollPhysics(),
            children: _categories
                .map((e) => Container(
                      decoration: BoxDecoration(
                        color: Utils.color('sbg'),
                        borderRadius: BorderRadius.circular(4.w),
                        border: Border.all(color: Utils.color('border')),
                      ),
                      padding: Utils.contentPadding(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            e["icon"],
                            size: 30.sp,
                          ),
                          Text(e["label"]),
                          SizedBox(height: 0.7.h),
                          Text(
                            '40 events',
                            style: TextStyle(color: Utils.color('st')),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) => _eventCard(),
          );
  }
}
