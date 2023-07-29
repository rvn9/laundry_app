part of 'home_screen.dart';

class _MostOrderedCard extends StatelessWidget {
  const _MostOrderedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.dryClean.image().image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFF6F7FA),
      ),
      child: SizedBox(
        height: 200.h,
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
                  'Dry Cleaning',
                  style: TextStyle(
                    color: ColorName.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '12x | total of 4000',
                  style: TextStyle(
                    color: ColorName.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
