import 'package:firebase_auth/firebase_auth.dart';

class GlobalVariables {
  static User user = FirebaseAuth.instance.currentUser!;
}
