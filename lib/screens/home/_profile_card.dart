part of 'home_screen.dart';

class _ProfileCard extends StatelessWidget {
  final String name;
  const _ProfileCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF6F7FA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/48/48",
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
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xFF737373),
                        ),
                      ),
                      Text(
                        name.toCapitalized(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 8,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorName.dodgerBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Your Balance',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: ColorName.white,
                        ),
                      ),
                      Text(
                        'IDR 14,000,000 ',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorName.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
