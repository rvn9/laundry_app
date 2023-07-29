import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/bloc/category/category_cubit.dart';
import 'package:laundry_app/bloc/product/product_cubit.dart';
import 'package:laundry_app/bloc/user/user_cubit.dart';
import 'package:laundry_app/extensions/string_extensions.dart';
import 'package:laundry_app/gen/colors.gen.dart';

import '../../bloc/authentication/authentication_cubit.dart';
import '../../gen/assets.gen.dart';
import '../../model/product.dart';
import '../../routes/router.gr.dart';

import '../../widgets/shimmer_widget.dart';

part '_profile_card.dart';
part '_category_card.dart';
part '_latest_order_card.dart';
part '_most_ordered_card.dart';
part '_product_card.dart';

class HomeScreen extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: HomeScreen,
    path: 'home',
  );
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AuthenticationCubit _authenticationCubit;
  late final CategoryCubit _categoryCubit;
  late final UserCubit _userCubit;
  late final ProductCubit _productCubit;

  @override
  void initState() {
    super.initState();
    _authenticationCubit = AuthenticationCubit.create();
    _categoryCubit = CategoryCubit.create();
    _userCubit = UserCubit.create();
    _productCubit = ProductCubit.create();
  }

  @override
  void dispose() {
    _authenticationCubit.close();
    _categoryCubit.close();
    _userCubit.close();
    _productCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.bittersweet,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorName.bittersweet,
        centerTitle: true,
        title: Text(
          'Be Laundry',
          style: TextStyle(fontSize: 22.sp, color: ColorName.white),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _authenticationCubit),
          BlocProvider.value(value: _categoryCubit),
          BlocProvider.value(value: _userCubit),
          BlocProvider.value(value: _productCubit),
        ],
        child: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => null,
            signOut: () =>
                AutoRouter.of(context).replace(const SignInScreenRoute()),
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) => state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => SizedBox(
                        width: double.infinity,
                        height: 120.h,
                        child: ShimmerWidget(
                          child: Card(
                            elevation: 0,
                            color: const Color(0xFFF6F7FA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      success: (user) => _ProfileCard(
                        name: user['name'],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) => state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => SizedBox(
                        height: 48.h,
                        child: ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return SizedBox(
                              width: 100.w,
                              child: ShimmerWidget(
                                child: Card(
                                  elevation: 0,
                                  color: const Color(0xFFF6F7FA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      success: (categories) => SizedBox(
                        height: 48.h,
                        child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            final category = categories[index];
                            return _CategoryCard(
                              key: ValueKey(category['id']),
                              categoryName: category['name'] ?? '',
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Latest Order',
                    style: TextStyle(
                      color: ColorName.summerSky,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const _LatestOrderCard(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Your most ordered product',
                    style: TextStyle(
                      color: ColorName.summerSky,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const _MostOrderedCard(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Our latest product',
                    style: TextStyle(
                      color: ColorName.summerSky,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) => state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return SizedBox(
                              width: 150.w,
                              child: ShimmerWidget(
                                child: Card(
                                  elevation: 0,
                                  color: const Color(0xFFF6F7FA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      success: (products) => SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          itemCount: products.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            final product = products[index];
                            return _ProductCard(
                              key: ValueKey(product.id),
                              product: product,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
