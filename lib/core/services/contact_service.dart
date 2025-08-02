import 'package:cloud_firestore/cloud_firestore.dart';

class ContactService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitContactForm({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    await _firestore.collection('contact_req_UAE').add({
      'name': name,
      'email': email,
      'phone': phone,
      'message': message,
      'submittedAt': FieldValue.serverTimestamp(),
    });
  }
}
