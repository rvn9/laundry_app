import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/model/product.dart';
import 'package:laundry_app/widgets/icon_chip_widget.dart';

import '../../gen/colors.gen.dart';
import '../../widgets/shimmer_widget.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  static const route = AdaptiveRoute(
    page: ProductDetail,
    path: 'product-detail',
  );

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late final ValueNotifier<int> _counter;

  @override
  void initState() {
    super.initState();
    _counter = ValueNotifier(0);
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GestureDetector(
            onTap: () => AutoRouter.of(context).pop(),
            child: Container(
              alignment: Alignment.center,
              height: 22,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 22,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl: widget.product.image != ''
                  ? widget.product.image
                  : "https://picsum.photos/200/200",
              fit: BoxFit.cover,
              placeholder: (context, url) => const ShimmerWidget(
                child: ColoredBox(
                  color: Color(0xfff8f8f8),
                ),
              ),
              errorWidget: (context, url, error) => const ColoredBox(
                color: Color(0xfff8f8f8),
                child: Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.product.name,
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.dodgerBlue,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'IDR ${widget.product.price}',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF797979),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconChipWidget(
                            label: widget.product.name,
                            labelColor: ColorName.dodgerBlue,
                            backgroundColor: ColorName.pattensBlue,
                          ),
                          IconChipWidget(
                            label: widget.product.sku,
                            backgroundColor: const Color(0xFFF6F7FA),
                            labelColor: Colors.black,
                          ),
                        ],
                      ),
                      Text(
                        '${widget.product.stock} Stocks Left!',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorName.bittersweet,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF838383),
                    ),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: _counter,
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => value != 0 ? _counter.value -= 1 : null,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: value == 0
                                  ? const Color(0xFFE0E0E0)
                                  : ColorName.dodgerBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                color: ColorName.white,
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          width: 100.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 1,
                              color: ColorName.dodgerBlue,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              '$value',
                              style: TextStyle(fontSize: 32.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        GestureDetector(
                          onTap: () => _counter.value += 1,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              color: ColorName.dodgerBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: ColorName.white,
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
