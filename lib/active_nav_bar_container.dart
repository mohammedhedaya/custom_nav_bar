import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';

class ActiveNavBarContainer extends StatelessWidget {
  const ActiveNavBarContainer({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor,
      ),
      child: SvgPicture.asset(
        image,
        colorFilter: const ColorFilter.mode(
          AppColors.blackColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
