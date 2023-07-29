import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../auth_guard.dart';
import '../../bloc/authentication/authentication_cubit.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../routes/router.gr.dart';
import '../../widgets/custom_button_widgets.dart';
import '../../widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: SignInScreen,
    initial: true,
    path: 'sign_in',
    guards: [AuthGuard],
  );

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final AuthenticationCubit _authenticationCubit;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final ValueNotifier<bool> _headerController;
  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _headerController = ValueNotifier(true);
    _authenticationCubit = AuthenticationCubit.create();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailNode = FocusNode();
    _emailNode.addListener(_onFocusChange);
    _passwordNode = FocusNode();
    _passwordNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _authenticationCubit.close();
    _emailController.clear();
    _passwordController.clear();
    _emailController.dispose();
    _passwordController.dispose();
    _headerController.dispose();
    _emailNode.removeListener(_onFocusChange);
    _emailNode.dispose();
    _passwordNode.removeListener(_onFocusChange);
    _passwordNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    _headerController.value = !(_emailNode.hasFocus || _passwordNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.dodgerBlue,
      body: BlocProvider.value(
        value: _authenticationCubit,
        child: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => null,
            error: (errorMsg) => Fluttertoast.showToast(
              msg: errorMsg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0,
            ),
            signIn: () =>
                AutoRouter.of(context).replace(const HomeScreenRoute()),
            signUp: () => Fluttertoast.showToast(
              msg: "Succesfully created account",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              fontSize: 16.0,
            ),
          ),
          child: Stack(
            children: [
              Assets.icons.homeVector.svg(),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _headerController,
                      builder: (context, value, child) => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: value
                            ? const SignInHeader()
                            : const SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Flexible(
                      flex: 1,
                      child: Form(
                        key: key,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorName.dodgerBlue,
                                  ),
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: _emailNode,
                                controller: _emailController,
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                hintText: 'Your email',
                                hasClearButton: true,
                                validator: (value) {
                                  if (value == '') {
                                    return 'Enter an email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorName.dodgerBlue,
                                  ),
                                ),
                              ),
                              CustomTextFormField(
                                focusNode: _passwordNode,
                                controller: _passwordController,
                                textInputAction: TextInputAction.done,
                                maxLines: 1,
                                hintText: 'Your password',
                                hasObscureToggle: true,
                                obscureText: true,
                                validator: (value) {
                                  if (value == '') {
                                    return 'Enter a password';
                                  }
                                  return null;
                                },
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () => AutoRouter.of(context).push(
                                  SignUpScreenRoute(
                                    onSignUp: (email, password, name, phone) =>
                                        _authenticationCubit.signUp(
                                      name: name,
                                      email: email,
                                      password: password,
                                      phone: phone,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Don't have an account yet ?  Sign Up",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: CustomButtonWidget(
                                  onClick: () {
                                    if (key.currentState?.validate() ?? false) {
                                      _authenticationCubit.signIn(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    }
                                  },
                                  title: "Sign In",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Be Laundry',
            style: TextStyle(
              fontSize: 22.sp,
              color: ColorName.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          Text(
            'Sign in to Your \nAccount',
            style: TextStyle(
              fontSize: 44.sp,
              color: ColorName.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'To Enter our app, you must sign in first',
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorName.white.withOpacity(0.63),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
