import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final GoogleSignIn googleSignIn = GoogleSignIn();


//Sign in ka function

Future<User?> signInwithGoogle()async{

  //SIGNING WITH GOOGLE
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;

  //CREATING CREDENTIAL FOR FIREBASE
  final AuthCredential credential = GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication?.idToken,
    accessToken: googleSignInAuthentication?.accessToken
  );

  //SIGNING IN WITH CREDENTIAL AND MAKING A USER IN FIREBASE GETTING USER CLASS
final userCredential = await auth.signInWithCredential(credential);
final User? user = userCredential.user;


// CHECKING IS ON
assert(!user!.isAnonymous);
assert(await user?.getIdToken() != null);

final User? currentUser = await auth.currentUser;
assert(currentUser?.uid == user?.uid);

print(user);
return user;


}
