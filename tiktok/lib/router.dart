import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/screens/features/authentication/login_screen.dart';
import 'package:tiktok/screens/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok/screens/features/authentication/sign_up_screen.dart';
import 'package:tiktok/screens/features/inbox/activity_screen.dart';
import 'package:tiktok/screens/features/onboarding/interests_screen.dart';

import 'common/widgets/main_navigation/main_navigation_screen.dart';

final routerProvider = Provider((ref) {
  //  ref.watch(authState);
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != SignUpScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: InterestsScreen.routeName,
        path: InterestsScreen.routeURL,
        builder: (context, state) => const InterestsScreen(),
      ),
      GoRoute(
        path: "/:tab(home|discover|inbox|profile)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
      GoRoute(
        name: ActivityScreen.routeName,
        path: ActivityScreen.routeURL,
        builder: (context, state) => const ActivityScreen(),
      ),
      // GoRoute(
      //   name: ChatsScreen.routeName,
      //   path: ChatsScreen.routeURL,
      //   builder: (context, state) => const ChatsScreen(),
      //   routes: [
      //     GoRoute(
      //       name: ChatDetailScreen.routeName,
      //       path: ChatDetailScreen.routeURL,
      //       builder: (context, state) {
      //         final chatId = state.params["chatId"]!;
      //         return ChatDetailScreen(
      //           chatId: chatId,
      //         );
      //       },
      //     )
      //   ],
      // ),
    ],
  );
});
