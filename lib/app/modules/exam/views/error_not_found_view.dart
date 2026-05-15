import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../routes/app_routes.dart';

class ErrorNotFoundView extends StatelessWidget {
  const ErrorNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('404', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            ShadButton(
              onPressed: () => Get.offAllNamed(Routes.root),
              child: const Text('홈으로'),
            ),
          ],
        ),
      ),
    );
  }
}
