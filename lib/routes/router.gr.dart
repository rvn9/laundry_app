// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:laundry_app/auth_guard.dart' as _i8;
import 'package:laundry_app/model/product.dart' as _i9;
import 'package:laundry_app/screens/auth/sign_in_screen.dart' as _i1;
import 'package:laundry_app/screens/auth/sign_up_screen.dart' as _i2;
import 'package:laundry_app/screens/home/home_screen.dart' as _i3;
import 'package:laundry_app/screens/invoice/invoice_screen.dart' as _i4;
import 'package:laundry_app/screens/product_detail/product_detail.dart' as _i5;

class AppRouters extends _i6.RootStackRouter {
  AppRouters({
    _i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SignInScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SignInScreen(),
        opaque: true,
      );
    },
    SignUpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpScreenRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.SignUpScreen(
          key: args.key,
          onSignUp: args.onSignUp,
        ),
        opaque: true,
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
        opaque: true,
      );
    },
    InvoiceScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.InvoiceScreen(),
        opaque: true,
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.ProductDetail(
          key: args.key,
          product: args.product,
        ),
        opaque: true,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'sign_in',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          SignInScreenRoute.name,
          path: 'sign_in',
          guards: [authGuard],
        ),
        _i6.RouteConfig(
          SignUpScreenRoute.name,
          path: 'sign_up',
        ),
        _i6.RouteConfig(
          HomeScreenRoute.name,
          path: 'home',
        ),
        _i6.RouteConfig(
          InvoiceScreenRoute.name,
          path: 'invoice',
        ),
        _i6.RouteConfig(
          ProductDetailRoute.name,
          path: 'product-detail',
        ),
      ];
}

/// generated route for
/// [_i1.SignInScreen]
class SignInScreenRoute extends _i6.PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(
          SignInScreenRoute.name,
          path: 'sign_in',
        );

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [_i2.SignUpScreen]
class SignUpScreenRoute extends _i6.PageRouteInfo<SignUpScreenRouteArgs> {
  SignUpScreenRoute({
    _i7.Key? key,
    required dynamic Function(
      String,
      String,
      String,
      String,
    ) onSignUp,
  }) : super(
          SignUpScreenRoute.name,
          path: 'sign_up',
          args: SignUpScreenRouteArgs(
            key: key,
            onSignUp: onSignUp,
          ),
        );

  static const String name = 'SignUpScreenRoute';
}

class SignUpScreenRouteArgs {
  const SignUpScreenRouteArgs({
    this.key,
    required this.onSignUp,
  });

  final _i7.Key? key;

  final dynamic Function(
    String,
    String,
    String,
    String,
  ) onSignUp;

  @override
  String toString() {
    return 'SignUpScreenRouteArgs{key: $key, onSignUp: $onSignUp}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: 'home',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i4.InvoiceScreen]
class InvoiceScreenRoute extends _i6.PageRouteInfo<void> {
  const InvoiceScreenRoute()
      : super(
          InvoiceScreenRoute.name,
          path: 'invoice',
        );

  static const String name = 'InvoiceScreenRoute';
}

/// generated route for
/// [_i5.ProductDetail]
class ProductDetailRoute extends _i6.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i7.Key? key,
    required _i9.Product product,
  }) : super(
          ProductDetailRoute.name,
          path: 'product-detail',
          args: ProductDetailRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.product,
  });

  final _i7.Key? key;

  final _i9.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}
