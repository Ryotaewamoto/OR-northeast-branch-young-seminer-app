import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/auth.dart';
import 'utils/routing/app_routes.dart';

/// [App] has routing settings
class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(signInAnonymouslyProvider)();
    final isSignedIn = ref.watch(isSignedInProvider).value ?? false;
    final goRouter = ref.watch(goRoutesProvider);
    return !isSignedIn
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
              title: 'Flutter Demo',
              // theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
              // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
              routeInformationParser: goRouter.routeInformationParser,
              routerDelegate: goRouter.routerDelegate,
              routeInformationProvider: goRouter.routeInformationProvider,
            ),
        );
  }
}
