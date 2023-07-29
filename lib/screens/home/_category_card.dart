part of 'home_screen.dart';

class _CategoryCard extends StatelessWidget {
  final String categoryName;
  const _CategoryCard({super.key, required this.categoryName});

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
        child: SizedBox(
          width: 100.w,
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
              Text(
                categoryName,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: const Color(0xFF737373),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
