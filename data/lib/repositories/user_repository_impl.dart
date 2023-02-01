import 'package:data/helpers/handle_network_mixin.dart';
import 'package:data/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository with HandleNetworkMixin {
  @override
  Future<bool> loginWithGmail(String email, String password) async {
    try {
      firebase.UserCredential userCredential = await firebase.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      return userCredential.user != null;
    } on firebase.FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isAuthentication() async {
    if (firebase.FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> registerWithGmail(String email, String password) async {
    try {
      firebase.UserCredential userCredential = await firebase.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user != null;
    } on firebase.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The password provided is too weak.');
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
