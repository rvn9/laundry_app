part of 'home_screen.dart';

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AutoRouter.of(context).push(ProductDetailRoute(product: product)),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          width: 150.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: product.image != ''
                  ? CachedNetworkImageProvider(product.image)
                  : Assets.images.dryClean.image().image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFFF6F7FA),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.5, 1],
                colors: [
                  ColorName.dodgerBlue.withOpacity(0),
                  const Color(0xFF3B97CB)
                ],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.toCapitalized(),
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'IDR ${product.price} / pc',
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
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
