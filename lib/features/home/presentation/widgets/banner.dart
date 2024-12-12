import 'package:flutter/material.dart';

class BannerContainer extends StatelessWidget {
  final int bannerCount;

  const BannerContainer({
    Key? key,
    required this.bannerCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner List'),
      ),
      body: ListView.builder(
        itemCount: bannerCount,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            height: 150.0, // ความสูงของแต่ละ Banner
            color: Colors.blueGrey[(index % 9 + 1) * 100], // สีสลับกันไป
          );
        },
      ),
    );
  }
}