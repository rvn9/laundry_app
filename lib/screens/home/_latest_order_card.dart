part of 'home_screen.dart';

class _LatestOrderCard extends StatelessWidget {
  const _LatestOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF6F7FA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: "https://picsum.photos/67/73",
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
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID: 21340',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF525252),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Order",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xFF535353),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'IDR 180,000',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorName.dodgerBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () =>
                  AutoRouter.of(context).push(const InvoiceScreenRoute()),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [
                      0.1,
                      0.9,
                    ],
                    colors: [
                      ColorName.dodgerBlue,
                      ColorName.dodgerBlue.withOpacity(0.43),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.icons.file.svg(),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Invoice',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorName.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
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
