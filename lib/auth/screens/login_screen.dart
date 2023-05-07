import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/common/store/shared_preference_repo.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/common/widgets/s_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.color('pbg'),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: Utils.screenPadding(),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 30.h, maxHeight: 40.h),
                  child: Image.asset("assets/images/login_bg.png"),
                ),
                Form(
                  key: _emailKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (String? value) => Utils.validator(value, 'email'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: Utils.inputDecoration(label: 'Email*'),
                    ),
                  ),
                ),
                Form(
                  key: _passKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: TextFormField(
                      controller: _passController,
                      validator: (String? value) => Utils.validator(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: Utils.inputDecoration(label: 'Password*'),
                    ),
                  ),
                ),
                SButton(
                  margin: EdgeInsets.only(top: 4.h, bottom: 2.h),
                  onTap: () => _handleLogin(),
                  label: 'Login',
                ),
                InkWell(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Utils.color("ba"),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pushNamed("/register");
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Still not part of Stocio? ',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp, color: Utils.color("pt")),
                        children: [
                          TextSpan(
                              text: 'Join now.',
                              style: TextStyle(
                                color: Utils.color("ba"),
                              ))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  _handleLogin() async {
    try {
      var state1 = _emailKey.currentState;
      var state2 = _passKey.currentState;

      if (state1 != null && state2 != null) {
        if (state1.validate() && state2.validate()) {
          // String email = _emailController.text.trim();
          // String pass = _passController.text.trim();
          // do login

          await SharedPrefRepo.save("at", "at");
          if (!mounted) return;
          Utils.customToast("User logged in");
          Navigator.of(context).pushReplacementNamed("/home");
        }
      }
    } catch (e, stack) {
      Utils.handleError(e, stack);
    }
  }
}
