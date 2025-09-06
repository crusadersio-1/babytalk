import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/app_export.dart';

import '../widgets/button.dart';
import '../widgets/edit_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final session = Supabase.instance.client.auth.currentSession;
    if (session != null && session.user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.cyan_100,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: appTheme.white_A700,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.h),
                  topRight: Radius.circular(50.h),
                ),
              ),
              padding: EdgeInsets.only(
                top: 32.h,
                left: 48.h,
                right: 48.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyleHelper.instance.headline30BoldNunito,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.h),
                      child: Text(
                        'Sign up now to get started!',
                        style: TextStyleHelper.instance.body14RegularNunito,
                      ),
                    ),
                    CustomEditText(
                      controller: emailController,
                      placeholder: 'Enter your email address',
                      leftIcon: ImageConstant.img5,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value!)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      margin: EdgeInsets.only(top: 48.h),
                    ),
                    CustomEditText(
                      controller: passwordController,
                      placeholder: 'Enter your password',
                      leftIcon: ImageConstant.imgBabytalkDraft41,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Password is required';
                        }
                        if (value!.length < 7) {
                          return 'Password must be at least 7 characters';
                        }
                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Password must contain at least one number';
                        }
                        return null;
                      },
                      margin: EdgeInsets.only(top: 34.h),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 18.h),
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          try {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            final response = await Supabase.instance.client.auth.signUp(
                              email: email,
                              password: password,
                            );

                            if (response.user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Registration successful! Please check your email.')),
                              );

                              Navigator.pushNamed(context, '/login');
                            }
                          } on AuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.message)),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Unexpected error occurred')),
                            );
                          }
                        }
                      },
                      margin: EdgeInsets.only(top: 56.h),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24.h),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyleHelper.instance.body12BoldNunito,
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyleHelper.instance.body12BoldNunito.copyWith(
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/login');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14.h, bottom: 14.h),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
