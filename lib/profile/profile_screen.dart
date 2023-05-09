import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/store/shared_preference_repo.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/common/widgets/s_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.color("pbg"),
      appBar: SAppbar(
        title: 'Profile',
        centerTitle: true,
        backPress: true,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedPrefRepo.remove("at");
                if (!mounted) return;
                await Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: SingleChildScrollView(
        padding: Utils.screenPadding(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Utils.color('sb')),
                  color: Utils.color('pb').withOpacity(0.4),
                ),
                height: 16.h,
                width: 16.h,
                child: Image.asset('assets/images/male_avatar.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  'Hemant Lakhotia',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                '1195110\nMember since 2023',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Utils.color('st')),
              ),
              SizedBox(height: 4.h),
              Divider(color: Utils.color('sb')),

              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.arrow_forward_rounded, color: Utils.color('sb'),)
                    ],
                  ),
                ),
              ),
              Divider(color: Utils.color('sb'))
            ],
          ),
        ),
      ),
    );
  }
}
