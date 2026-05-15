import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void _showToast(ShadToast toast) {
  final context = Get.context;
  if (context == null) return;
  final toaster = ShadToaster.maybeOf(context);
  if (toaster == null) return;
  toaster.show(toast);
}

/// 안내·성공 메시지
void showExamInfoToast(String title, String description) {
  _showToast(ShadToast(title: Text(title), description: Text(description)));
}

/// 오류 메시지
void showExamErrorToast(String title, String description) {
  _showToast(
    ShadToast.destructive(title: Text(title), description: Text(description)),
  );
}

/// 경고 메시지
void showExamWarningToast(String title, String description) {
  _showToast(
    ShadToast.destructive(title: Text(title), description: Text(description)),
  );
}
