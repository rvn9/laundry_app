import 'package:auto_route/auto_route.dart';
import 'package:laundry_app/screens/product_detail/product_detail.dart';

import '../screens/auth/sign_in_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/invoice/invoice_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  SignInScreen.route,
  SignUpScreen.route,
  HomeScreen.route,
  InvoiceScreen.route,
  ProductDetail.route,
])
class $AppRouters {}
