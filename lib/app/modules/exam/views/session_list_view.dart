import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../routes/app_routes.dart';
import '../controllers/session_list_controller.dart';

class SessionListView extends GetView<SessionListController> {
  const SessionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.error.value.isNotEmpty) {
        return Center(
          child: Text(
            controller.error.value,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        );
      }
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.sessions.length,
        itemBuilder: (_, i) {
          final s = controller.sessions[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _SessionRow(
              session: s,
              progressLabel: controller.progressPercentLabel(s),
              repeatLabel: controller.repeatCountLabel(s),
              onTap: () => Get.toNamed(
                Routes.sheetPath(controller.subject, s),
              ),
            ),
          );
        },
      );
    });
  }
}

class _SessionRow extends StatelessWidget {
  const _SessionRow({
    required this.session,
    required this.progressLabel,
    required this.repeatLabel,
    required this.onTap,
  });

  final String session;
  final String progressLabel;
  final String repeatLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    session,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(progressLabel),
                const SizedBox(width: 12),
                Text(repeatLabel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
