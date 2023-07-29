import 'package:auto_route/auto_route.dart';

import '../screens/auth/sign_in_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/home/home_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  SignInScreen.route,
  SignUpScreen.route,
  HomeScreen.route,
])
class $AppRouters {}
