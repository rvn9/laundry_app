import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../gen/colors.gen.dart';
import '../../widgets/shimmer_widget.dart';
import 'custom_container_shape.dart';
import '../../widgets/custom_button_widgets.dart';

part '_invoice_tile.dart';

class InvoiceScreen extends StatefulWidget {
  static const route = AdaptiveRoute(
    page: InvoiceScreen,
    path: 'invoice',
  );
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: const Icon(
            Icons.arrow_back_ios,
            color: ColorName.dodgerBlue,
          ),
          onTap: () {
            AutoRouter.of(context).pop();
          },
        ),
        backgroundColor: ColorName.white,
        centerTitle: true,
        title: Text(
          'Order Summary',
          style: TextStyle(
            color: ColorName.dodgerBlue,
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: CustomContainerClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF6F7FA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    width: 500,
                    height: 500,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'ORDER #21340',
                              style: TextStyle(
                                color: ColorName.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Outlet Location',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: const Color(0xFF535353),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Sahid Sudirman',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xFF535353),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '123 Pasir Ris',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF535353),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '138810, Singapore',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF535353),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (_, __) => const Divider(
                              color: ColorName.dodgerBlue,
                            ),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const _InvoiceTile();
                            },
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Total Order",
                                  style: TextStyle(
                                    color: ColorName.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'IDR 180,000',
                                  style: TextStyle(
                                    color: ColorName.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonWidget(
                    backgroundColor: ColorName.mediumAquamarine,
                    title: 'Whatsapp US',
                    onClick: () {},
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonWidget(
                    textColor: ColorName.dodgerBlue,
                    borderColor: ColorName.dodgerBlue,
                    backgroundColor: ColorName.white,
                    title: 'Download Invoice',
                    onClick: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
