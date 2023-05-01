import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project2/screens/sign%20up.dart';


class Auth_services{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {

    // Sign in with Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential =
    await _auth.signInWithCredential(credential);

    // Check if user is new or existing
    final User? user = userCredential.user;
    final bool isNewUser = userCredential.additionalUserInfo!.isNewUser;

    if (isNewUser) {
      sign = true;
    } else {
      sign = false;
    }
    return user;
  }
}