import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/common/widgets/s_appbar.dart';
import 'package:stocio_app/common/widgets/s_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _idController = TextEditingController();

  String instituteName = "";
  List<String> instituteNames = ["National Institute of Technology Kurukshetra, Kurukshetra"];

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _idController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(instituteName);
    return Scaffold(
      backgroundColor: Utils.color('pbg'),
      appBar: SAppbar(
        title: instituteName.isEmpty ? 'Choose your institute' : 'Register',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: Utils.screenPadding(),
        child: Form(
          key: _registerKey,
          child: instituteName.isEmpty
              ? Column(children: [
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    items: instituteNames
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e, overflow: TextOverflow.fade),
                            ))
                        .toList(),
                    decoration: Utils.inputDecoration(label: "Choose your institute"),
                    onChanged: (String? value) => setState(() => instituteName = value!),
                  ),
                ])
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        instituteName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                        child: InkWell(
                            onTap: () => setState(() => instituteName = ""),
                            child: Text(
                              'Change Institute',
                              style: TextStyle(color: Utils.color('ba'), fontWeight: FontWeight.w500),
                            ))),
                    TextFormField(
                      controller: _nameController,
                      decoration: Utils.inputDecoration(label: 'Name*'),
                      validator: (value) => Utils.validator(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 1.5.h),
                    TextFormField(
                      controller: _emailController,
                      decoration: Utils.inputDecoration(label: 'Email*'),
                      validator: (value) => Utils.validator(value, 'email'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 1.5.h),
                    TextFormField(
                      controller: _passController,
                      decoration: Utils.inputDecoration(label: 'Create password*'),
                      validator: (value) => Utils.validator(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 1.5.h),
                    // TextFormField(
                    //   decoration: Utils.inputDecoration(label: 'Confirm password*'),
                    //   validator: (value) => Utils.validator(value),
                    // ),
                    // SizedBox(height: 1.5.h),
                    TextFormField(
                      controller: _idController,
                      decoration: Utils.inputDecoration(label: 'Institute Id*'),
                      validator: (value) => Utils.validator(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SButton(margin: EdgeInsets.only(top: 4.h), onTap: () => _handleRegister(), label: 'Register')
                  ],
                ),
        ),
      ),
    );
  }

  _handleRegister() async {
    try {
      var state = _registerKey.currentState;
      if(state!=null && state.validate()) {
        Utils.customToast("Signing in");
        showModalBottomSheet(
            useSafeArea: true,
            isDismissible: false,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 3.h),
                    Text(
                      'We have sent an email to your mail.',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                    ),
                    SButton(
                        margin: EdgeInsets.symmetric(vertical: 3.h),
                        onTap: () => Navigator.popUntil(context, ModalRoute.withName('/login')),
                        label: 'Go to login')
                  ],
                ),
              );
            });
      }
    } catch (e, stack) {
      Utils.handleError(e, stack);
    }
  }
}
