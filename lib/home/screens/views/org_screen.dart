import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

class OrgScreen extends StatefulWidget {
  const OrgScreen({Key? key}) : super(key: key);

  @override
  State<OrgScreen> createState() => _OrgScreenState();
}

class _OrgScreenState extends State<OrgScreen> {
  List organizations = [
    // {"name": "MicroBus"}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: Utils.screenPadding(),
        child: organizations.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You are not part of \nany \nOrganizations.',
                    style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h, bottom: 2.h),
                    child: Text(
                      'We have some suggestions for you.',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, i) => _organizationCard(),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Text(
                      'Organizations joined',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, i) => _organizationCard(),
                  ),
                ],
              ),
      ),
    );
  }

  _organizationCard() {
    return SizedBox(
      height: 26.h,
      child: Stack(
        children: [
          Positioned(
            top: 0.7.h,
            left: 1.2.w,
            child: Container(
              height: 22.h,
              width: 87.w,
              decoration: BoxDecoration(
                color: Utils.color('sb'),
                border: Border.all(color: Utils.color('border'), width: 2),
              ),
            ),
          ),
          Container(
            height: 22.h,
            width: 87.w,
            padding: Utils.contentPadding(),
            decoration: BoxDecoration(
              color: Utils.color('sbg'),
              border: Border.all(color: Utils.color('border'), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
                ),
                SizedBox(height: 1.5.h),
                Text(
                  'Short Description about organization Short Description about organization Short Description about organization',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Utils.color('st')),
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () => _handleJoinTap(),
                    child: Text(
                      organizations.isEmpty ? 'Request to Join' : 'See more...',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Utils.color('ba')),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleJoinTap() {}
}
