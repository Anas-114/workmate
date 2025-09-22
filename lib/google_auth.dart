// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseServices {

//   final auth =FirebaseAuth.instance;

//   final googeSignIn =GoogleSignIn();

//   Future <bool>SignInwithGoogle()async{
//     try {
      
//       final GoogleSignInAccount? googleSignInAccount =await googeSignIn
//       .signIn();
//       if (googleSignInAccount==null) {
//         return false;
        
//       }

//       final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//       final AuthCredential authCredential= GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken
//       );

//       await auth.signInWithCredential(authCredential);
//       return true;
//     } on FirebaseAuthException catch (e) {

//  print(e.toString());
//  log(e.toString());
//  return false;      
//     }
//   }

// GoogleSignOut()async{
//   await auth.signOut();
//   await googeSignIn.signOut();
// }

  
// }