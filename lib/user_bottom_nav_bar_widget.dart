import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'generated/l10n.dart';

class UserBottomNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const UserBottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _UserBottomNavBarWidgetState createState() => _UserBottomNavBarWidgetState();
}

class _UserBottomNavBarWidgetState extends State<UserBottomNavBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 0.1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(covariant UserBottomNavBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
            ),
            child: Container(
              padding: EdgeInsets.only(
                bottom: screenHeight * 0.020,
                top: screenHeight * 0.020,
              ),
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  _buildNavItem(0, Assets.academy, S.of(context).Academy,
                      screenWidth, screenHeight),
                  const Spacer(),
                  _buildNavItem(1, Assets.scanners, S.of(context).Scanners,
                      screenWidth, screenHeight),
                  const Spacer(),
                  _buildNavItem(2, Assets.home1, S.of(context).Home,
                      screenWidth, screenHeight),
                  const Spacer(),
                  _buildNavItem(3, Assets.buyAndSell, S.of(context).tradeAlert,
                      screenWidth, screenHeight),
                  const Spacer(),
                  _buildNavItem(4, Assets.menu1, S.of(context).Menu,
                      screenWidth, screenHeight),
                  const Spacer(),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                bottom: screenHeight * 0.06 + 20 * _animation.value,
                left: screenWidth * (widget.selectedIndex / 5) +
                    screenWidth * 0.07,
                child: Transform.rotate(
                  angle: 0.785398,
                  child: Container(
                    width: screenWidth * 0.12,
                    height: screenWidth * 0.12,
                    decoration: BoxDecoration(
                      color: AppColors.yellowWithOpacityInCard,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.yellowWithOpacityInCard
                              .withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: -0.785398,
                        child: SvgPicture.asset(
                          _getIconForIndex(widget.selectedIndex),
                          height: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Assets.academy;
      case 1:
        return Assets.scanners;
      case 2:
        return Assets.home1;
      case 3:
        return Assets.buyAndSell;
      case 4:
      default:
        return Assets.menu1;
    }
  }

  Widget _buildNavItem(int index, String asset, String label,
      double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            asset,
            color: widget.selectedIndex == index
                ? Colors.transparent
                : Colors.white,
            height: screenWidth * 0.06,
          ),
          Text(
            label,
            style: TextStyle(
              color: widget.selectedIndex == index
                  ? Colors.transparent
                  : Colors.white,
              fontSize: screenWidth * 0.030,
            ),
          ),
        ],
      ),
    );
  }
}
