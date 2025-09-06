import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/app_export.dart';

import '../widgets/button.dart';
import '../widgets/edit_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final supabase = Supabase.instance.client;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final session = supabase.auth.currentSession;
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
                      'Login',
                      style: TextStyleHelper.instance.headline30BoldNunito,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.h),
                      child: Text(
                        'Welcome back! Time to get started again.',
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
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      margin: EdgeInsets.only(top: 34.h),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 18.h),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyleHelper.instance.label10BoldNunito,
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      text: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          try {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            final response = await supabase.auth.signInWithPassword(
                              email: email,
                              password: password,
                            );

                            if (response.user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login successful!')),
                              );
                              Navigator.pushReplacementNamed(context, '/home');
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
                              text: 'No account yet? ',
                            ),
                            TextSpan(
                              text: 'Register',
                              style: TextStyleHelper.instance.body12BoldNunito.copyWith(
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/register');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14.h, bottom: 14.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text(
                          'Continue as guest',
                          style: TextStyleHelper.instance.body12RegularNunito,
                        ),
                      ),
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