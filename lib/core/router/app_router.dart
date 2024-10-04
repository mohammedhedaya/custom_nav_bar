import 'package:go_router/go_router.dart';

import '../constants/constants.dart';


final GoRouter router = GoRouter(
  initialLocation: token == null ? '/' : '/navBarView',
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const LoginView(),
    // ),
    // GoRoute(
    //   path: '/navBarView',
    //   builder: (context, state) => const UserMainLayoutScreen(),
    // ),
    // GoRoute(
    //   path: '/subtileTabBar',
    //   builder: (context, state) => const InstractorScreen(),
    // ),
    // GoRoute(
    //   path: '/academy',
    //   builder: (context, state) => const AcademyView(),
    // ),
  ],
);
//
