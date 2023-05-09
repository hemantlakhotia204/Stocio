import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/auth/models/institute_model.dart';
import 'package:stocio_app/auth/models/register_model.dart';
import 'package:stocio_app/auth/services/register_service.dart';
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

  final _registerService = RegisterService();

  InstituteModel institute = InstituteModel(id: "", domainIds: [], instituteName: "");
  List<InstituteModel> instituteList = [];

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
    log(institute.toJson().toString());
    return Scaffold(
      backgroundColor: Utils.color('pbg'),
      appBar: SAppbar(
        title: institute.instituteName.isEmpty ? 'Choose your institute' : 'Register',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: Utils.screenPadding(),
        child: Form(
          key: _registerKey,
          child: institute.instituteName.isEmpty
              ? FutureBuilder(
                  future: _fetchInstitutes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      children: [
                        DropdownButtonFormField<InstituteModel>(
                          isExpanded: true,
                          items: instituteList
                              .map((e) => DropdownMenuItem<InstituteModel>(
                                    value: e,
                                    child: Text(e.instituteName, overflow: TextOverflow.fade),
                                  ))
                              .toList(),
                          decoration: Utils.inputDecoration(label: "Choose your institute"),
                          onChanged: (InstituteModel? value) {
                            if (value != null) {
                              setState(() => institute = value);
                            }
                          },
                        ),
                      ],
                    );
                  },
                )
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        institute.instituteName,
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
                            onTap: () =>
                                setState(() => institute = InstituteModel(id: "", domainIds: [], instituteName: "")),
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
      if (state != null && state.validate()) {
        final member = RegisterModel(
          name: _nameController.text.trim(),
          email: _emailController.text.toLowerCase().trim(),
          password: _passController.text.trim(),
          institute: " instituteId",
          instituteId: _idController.text.trim(),
        );

        await _registerService.registerMember(member);

        if (!mounted) return;
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

  _fetchInstitutes() async {
    try {
      if (instituteList.isEmpty) {
        var res = await _registerService.fetchInstitutes();

        log(res.data.toString());
        instituteList =
            (res.data as List<dynamic>?)?.map((e) => InstituteModel.fromJson(e as Map<String, dynamic>)).toList() ?? [];
      }
    } catch (e, stack) {
      Utils.handleError(e, stack);
    }
  }
}
