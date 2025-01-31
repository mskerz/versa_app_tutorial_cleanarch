// Create shimmerLoading method
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerLabelLoading(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Theme.of(context).colorScheme.primary,
    highlightColor: Theme.of(context).colorScheme.primaryContainer,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
color: Theme.of(context).colorScheme.primaryContainer
          ),
          width: 250,
          height: 18,
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}

Widget shimmerProgressBar(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(15, 0, 0, 0),
          width: 1,
        )),
    child: Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primary,
      highlightColor: Theme.of(context).colorScheme.primaryContainer,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // กำหนดให้เป็นรูปทรงวงกลม
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer, // กำหนดสีของวงกลม
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer),
                width: 250,
                height: 14,
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primaryContainer),
                width: 250,
                height: 14,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget shimmerLoggedInProgressBar(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 60,
                height: 10,
                color: Colors.white,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: CircularProgressIndicator(
                value: null, // Set to null for shimmer effect
                backgroundColor: Theme.of(context).colorScheme.secondary,
                valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 200,
              height: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 150,
              height: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ],
  );
}
