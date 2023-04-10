import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



  Future<bool> isFirstTimeGoogleSignIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = googleSignIn.currentUser;
    // if (googleUser == null) {
    //   googleUser = await googleSignIn.signInSilently();
    // }
    googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);

    return userCredential.additionalUserInfo!.isNewUser;
  }


