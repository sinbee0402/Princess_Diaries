import 'package:go_router/go_router.dart';
import 'package:princess_diaries/di/di_setup.dart';
import 'package:princess_diaries/presentation/components/curved_navigation_widget.dart';
import 'package:princess_diaries/presentation/main/main_view_model.dart';
import 'package:princess_diaries/presentation/time_line/time_line_screen.dart';
import 'package:princess_diaries/presentation/time_line/time_line_view_model.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<MainViewModel>(),
        child: const CurvedNavigationWidget(),
      ),
    ),
    GoRoute(
      path: '/time_line',
      builder: (context, state) => ChangeNotifierProvider<TimeLineViewModel>(
        create: (_) => getIt<TimeLineViewModel>(),
        child: const TimeLineScreen(),
      ),
    ),
    //GoRoute(
    //       path: '/add_post',
    //       builder: (context, state) => ChangeNotifierProvider(
    //         create: (_) => getIt<AddEditPostViewModel>(),
    //         child: const AddEditPostScreen(),
    //       ),
    //     ),
    //     GoRoute(
    //       path: '/edit_post',
    //       builder: (context, state) => ChangeNotifierProvider(
    //         create: (_) => getIt<AddEditPostViewModel>(),
    //         child: AddEditPostScreen(post: state.extra! as Post),
    //       ),
    //     ),
  ],
);
