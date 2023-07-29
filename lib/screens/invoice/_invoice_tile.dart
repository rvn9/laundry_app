part of 'invoice_screen.dart';

class _InvoiceTile extends StatelessWidget {
  const _InvoiceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bag of laundry',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF525252),
            ),
          ),
          Text(
            'Qty : 1',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: ColorName.dodgerBlue,
            ),
          ),
        ],
      ),
      leading: ClipRRect(
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
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF535353),
            ),
          ),
          Text(
            'IDR 18,000',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorName.dodgerBlue,
            ),
          ),
        ],
      ),
    );
  }
}
