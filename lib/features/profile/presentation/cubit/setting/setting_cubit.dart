import 'package:book_doc/features/profile/presentation/cubit/setting/setting_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      GoogleSignIn googleSignIn = GoogleSignIn();
      bool isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        await googleSignIn.signOut();
      }
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(SignOutSuccessState());
      }
    } catch (e) {
      emit(SignOutErrorState(errorMessage: e.toString()));
    }
  }
}
