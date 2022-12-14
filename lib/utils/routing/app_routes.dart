import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/pages/name_edit.dart';
import 'package:or_northeast_branch_young_seminer_app/pages/presentation_detail.dart';
import 'package:or_northeast_branch_young_seminer_app/pages/presentation_list.dart';

import '../../app.dart';
import '../../pages/home.dart';
import '../exceptions/base.dart';
import '../navigator_key.dart';
import 'animation.dart';
import 'scaffold_with_nav_bar.dart';

/// This [Provider] controls app routing with [GoRouter]. Particularly this
/// is used [App] class.
///
/// A [routes] argument takes a list of [GoRoute] or [ShellRoute] because
/// these classes extend [RouteBase]. Other argument [navigatorKey] is a key used specifying
/// parent key from below [GoRoute]. If you use [BottomNavigationBar], Two keys
/// [rootNavigatorKeyProvider] and [shellNavigatorKeyProvider] are necessary.
///
final goRoutesProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    navigatorKey: ref.watch(rootNavigatorKeyProvider),
    initialLocation: HomePage.path,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: ref.watch(rootNavigatorKeyProvider),
        path: NameEditPage.path,
        name: NameEditPage.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithFullScreenAnimation(
            page: const NameEditPage(
              key: ValueKey(NameEditPage.name),
            ),
          );
        },
      ),
      ShellRoute(
        navigatorKey: ref.watch(shellNavigatorKeyProvider),
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: HomePage.path,
            name: HomePage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return buildPageWithAnimation(
                page: const HomePage(
                  key: ValueKey(HomePage.name),
                ),
              );
            },
            routes: <RouteBase>[
              // GoRoute(
              //     parentNavigatorKey: ref.watch(rootNavigatorKeyProvider),
              //     path: NameEditPage.path,
              //     name: NameEditPage.name,
              //     pageBuilder: (BuildContext context, GoRouterState state) {
              //       return buildPageWithFullScreenAnimation(
              //         page: const NameEditPage(
              //           key: ValueKey(NameEditPage.name),
              //         ),
              //       );
              //     },
              //   ),
            ]
          ),
          GoRoute(
            path: PresentationListPage.location,
            name: PresentationListPage.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return buildPageWithAnimation(page: const PresentationListPage(
                key: ValueKey(PresentationListPage.name),
              ));
            },
          ),
          GoRoute(
            // English:
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
            // ?????????:
            // ???????????? parentNavigatorKey ?????????????????????????????????????????? key ???
            // ???????????? shell ??? navigator key ?????????????????????
            // [BottomNavigationBar] ????????????????????????????????????????????????
            path: PresentationDetailPage.path,
            name: PresentationDetailPage.name,
            builder: (BuildContext context, GoRouterState state) {
              return ProviderScope(
                overrides: <Override>[
                  goRouterStateProvider.overrideWithValue(state),
                ],
                child: const PresentationDetailPage(
                  key: ValueKey(PresentationDetailPage.name),
                ),
              );
            },
          ),
        ],
      ),
    ],
  ),
);

final goRouterStateProvider = Provider<GoRouterState>(
  (_) => throw const AppException(message: '?????????????????????????????????????????????'),
);

/// This class was included
// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen(
//           (dynamic _) => notifyListeners(),
//         );
//   }

//   late final StreamSubscription<dynamic> _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
