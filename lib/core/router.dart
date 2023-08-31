import 'package:go_router/go_router.dart';
import 'package:princess_diaries/di/di_setup.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_screen.dart';
import 'package:princess_diaries/presentation/add_edit_post/add_edit_post_view_model.dart';
import 'package:princess_diaries/presentation/components/curved_navigation_widget.dart';
import 'package:princess_diaries/presentation/setting/setting_screen.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CurvedNavigationWidget(),
    ),
    GoRoute(
      path: '/add_post',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<AddEditPostViewModel>(),
        child: const AddEditPostScreen(),
      ),
    ),
    GoRoute(
      path: '/edit_post',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<AddEditPostViewModel>(),
        child: AddEditPostScreen(post: state.extra! as Post),
      ),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingScreen(),
    ),
  ],
);
