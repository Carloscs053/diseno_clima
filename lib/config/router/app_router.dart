import 'package:go_router/go_router.dart';
import 'package:segundo_diseno/presentation/screens/basico_page.dart';
import 'package:segundo_diseno/presentation/screens/scroll_page.dart';

final appRouter = GoRouter(
  initialLocation: '/scroll',
  routes: [
    GoRoute(path: '/scroll', builder: (context, state) => ScrollPage()),
    GoRoute(path: '/basico', builder: (context, state) => BasicoPage()),
  ],
);
