import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:versa_app_tutorial_cleanarch/shared/widgets/provider/ui_provider.dart';


class BannerItem {
  final String title;
  final String subtitle;
  final Gradient gradient;

  BannerItem({
    required this.title,
    required this.subtitle,
    required this.gradient,
  });
}

class ContentCarouselSlider extends ConsumerStatefulWidget {
  final Gradient? gradientColor;
  const ContentCarouselSlider({super.key, this.gradientColor});

  @override
  ConsumerState<ContentCarouselSlider> createState() =>
      _ContentCarouselSlider();
}

class _ContentCarouselSlider extends ConsumerState<ContentCarouselSlider> {
final List<BannerItem> bannerItems = [
    BannerItem(
      title: 'เจาะลึก ICO Portal',
      subtitle: 'ก้าวแรกสู่การลงทุนที่จะเปลี่ยนชีวิตคุณ',
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.green],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    BannerItem(
      title: 'Digital Token: กุญแจสู่ความมั่งคั่งในโลกคริปโต',
      subtitle: 'เริ่มต้นสร้างพอร์ตการลงทุนแห่งอนาคต',
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.pink],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    BannerItem(
      title: 'เคล็ดลับเลือกกระเป๋าเงินดิจิทัลให้ปลอดภัย รองรับทุกการใช้งาน',
      subtitle: 'คู่มือฉบับสมบูรณ์สำหรับมือใหม่',
      gradient: LinearGradient(
        colors: [Colors.orange, Colors.red],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    BannerItem(
      title: 'ลงทุน ICO: โอกาสทองในยุคเศรษฐกิจดิจิทัล',
      subtitle: 'เจาะลึกทุกมุมมองการลงทุนแห่งอนาคต',
      gradient: LinearGradient(
        colors: [Colors.yellow, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    BannerItem(
      title: 'Blockchain: เทคโนโลยีปฏิวัติโลกแห่งศตวรรษที่ 21',
      subtitle: 'เปิดโลกใหม่แห่งความเป็นไปได้ไม่มีที่สิ้นสุด',
      gradient: LinearGradient(
        colors: [Colors.green, Colors.teal],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    BannerItem(
      title: 'Web3 คืออะไร ?',
      subtitle: 'พลิกโฉมการใช้งานเว็บไซต์ที่คุณต้องรู้',
      gradient: LinearGradient(
        colors: [Colors.cyan, Colors.teal],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
];
  @override
  Widget build(BuildContext context) {
    final activeIndex = ref.watch(activeIndexProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          itemCount: bannerItems.length,
          itemBuilder: (context, index, realIndex) {
            final item = bannerItems[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: item.gradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25,),
                    Text(
                      item.title,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    Text(
                      item.subtitle,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.prompt(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 150,
            
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8, // Make the non-active items smaller
            enlargeStrategy: CenterPageEnlargeStrategy.scale, // Scale up the center item
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            onPageChanged: (index, reason) {
              ref.read(activeIndexProvider.notifier).state = index;
            },
          ),
        ),
        const SizedBox(height: 10),
        // Smooth Indicator
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: bannerItems.length,
          effect: ExpandingDotsEffect(
            dotWidth: 6,
            dotHeight: 6,
            activeDotColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
