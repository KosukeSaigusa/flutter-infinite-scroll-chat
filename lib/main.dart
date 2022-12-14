import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'repositories/app_user.dart';
import 'repositories/chat.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 画面の向きを固定する。
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Firebase を初期化する。
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      overrides: [
        baseAppUserRepositoryProvider.overrideWith((ref) => ref.read(appUserRepositoryProvider)),
        baseChatRepositoryProvider.overrideWith((ref) => ref.read(chatRepositoryProvider)),
      ],
      child: const App(),
    ),
  );
}
