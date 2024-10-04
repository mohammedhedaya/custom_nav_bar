// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(100.h),
//       child: Stack(
//         children: [
//           ClipPath(
//             clipper: AppBarClipper(),
//             child: Container(
//               color: AppColors.blackColor,
//               child: AppBar(
//                 automaticallyImplyLeading: false,
//                 surfaceTintColor: Colors.transparent,
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 flexibleSpace: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(
//                             Assets.tsLogo,
//                             height: 75.h,
//                           ),
//                           SizedBox(width: 10.w),
//                           Image.asset(
//                             Assets.imageTextInAppBar,
//                             height: 35.h,
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 30.w),
//                         child: Stack(
//                           children: [
//                             SvgPicture.asset(
//                               Assets.notificationTrade,
//                               height: 41.95.h,
//                               width: 31.w,
//                             ),
//                             Positioned(
//                               right: 10,
//                               top: 22,
//                               child: Text(
//                                 '5', // Notification count
//                                 style: AppStyles.style9W400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 1.h,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.colorOnWrap.withOpacity(0.4),
//                     spreadRadius: 5,
//                     blurRadius: 15,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize =>
//       Size.fromHeight(100.h); // Custom height for the app bar
// }
