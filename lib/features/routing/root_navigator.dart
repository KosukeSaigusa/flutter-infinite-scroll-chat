import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/global_key.dart';
import '../../utils/loading.dart';
import '../../utils/widgets/not_found_page.dart';
import '../auth/auth.dart';
import 'app_router.dart';

/// ウィジェットツリーの上位にある Navigator を含むウィジェット。
class RootNavigator extends HookConsumerWidget {
  const RootNavigator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Navigator(
            key: ref.watch(globalKeyProvider),
            initialRoute: ref.watch(appRouterProvider).initialRoute,
            onGenerateRoute: ref.watch(appRouterProvider).onGenerateRoute,
            onUnknownRoute: (settings) {
              final route = MaterialPageRoute<void>(
                settings: settings,
                builder: (context) => const NotFoundPage(),
              );
              return route;
            },
          ),
          if (ref.watch(showOverlayLoadingProvider)) const OverlayLoadingWidget(),
          if (!(ref.watch(isSignedInAsyncValueProvider).value ?? false))
            const OverlayLoadingWidget(showLoadingWidget: false),
        ],
      ),
    );
  }
}
