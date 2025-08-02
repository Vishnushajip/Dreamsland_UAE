import 'package:dreamslanduae/core/services/contact_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameControllerProvider = Provider.autoDispose(
  (ref) => TextEditingController(),
);
final emailControllerProvider = Provider.autoDispose(
  (ref) => TextEditingController(),
);
final phoneControllerProvider = Provider.autoDispose(
  (ref) => TextEditingController(),
);
final messageControllerProvider = Provider.autoDispose(
  (ref) => TextEditingController(),
);

final loadingProvider = StateProvider<bool>((ref) => false);
final submitStatusProvider = StateProvider<SubmitStatus?>((ref) => null);

class SubmitStatus {
  final bool success;
  final String message;
  SubmitStatus({required this.success, required this.message});
}

final contactServiceProvider = Provider<ContactService>((ref) {
  return ContactService();
});
