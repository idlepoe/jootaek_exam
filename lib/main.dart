import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'app/bindings/initial_binding.dart';
import 'app/controllers/exam_user_options_controller.dart';
import 'app/modules/exam/views/error_not_found_view.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'data/repositories/exam_progress_repository.dart';
import 'data/repositories/exam_remote_repository.dart';
import 'data/repositories/exam_user_options_repository.dart';
import 'data/repositories/mock_exam_storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(ExamProgressRepository.create, permanent: true);
  await Get.putAsync(MockExamStorageRepository.create, permanent: true);
  await Get.putAsync(ExamUserOptionsRepository.create, permanent: true);
  Get.put(ExamRemoteRepository(), permanent: true);

  runApp(const JootaekExamApp());
}

class JootaekExamApp extends StatelessWidget {
  const JootaekExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    final opts = Get.put(ExamUserOptionsController(), permanent: true);
    InitialBinding().dependencies();

    return Obx(
      () => GetMaterialApp(
        title: '광고없는주택관리사1차기출회독',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        themeMode: opts.themeMode,
        builder: (context, child) {
          final brightness = Theme.of(context).brightness;
          return ShadTheme(
            data: ShadThemeData(
              brightness: brightness,
              colorScheme: brightness == Brightness.dark
                  ? const ShadSlateColorScheme.dark()
                  : const ShadSlateColorScheme.light(),
            ),
            child: ShadToaster(
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        unknownRoute: GetPage(
          name: Routes.notFound,
          page: () => const ErrorNotFoundView(),
        ),
      ),
    );
  }
}
