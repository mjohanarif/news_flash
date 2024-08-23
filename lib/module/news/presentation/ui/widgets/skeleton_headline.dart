import 'package:flutter/material.dart';
import 'package:news_flash/shared/shared.dart';

class SkeletonHeadline extends StatelessWidget {
  const SkeletonHeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeleton(
          width: AppDimension.width,
          height: 200,
        ),
        const SpaceHeight(8),
        const Skeleton(
          width: 100,
          height: 10,
        )
      ],
    );
  }
}

class SkeletonNews extends StatelessWidget {
  const SkeletonNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return Skeleton(
          height: 80,
          width: AppDimension.width,
        );
      },
      separatorBuilder: (context, index) => const SpaceHeight(12),
      itemCount: 6,
    );
  }
}
