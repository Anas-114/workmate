// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:workmate/google_auth.dart';

// final GoogleSignIn _googleSignIn =GoogleSignIn(scopes:['email']);

// class GoogleLoginScreen extends StatefulWidget {
//   const GoogleLoginScreen({super.key});

//   @override
//   State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
// }

// class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//   _googleSignIn.onCurrentChanged.lisen((account){
//     if ( mounted) {
//       setState(() {
        
//       });
//     }
//   });

//   _googleSignIn.signInSilently();



//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Column(
//         children: [
//           Padding(padding:  EdgeInsetsGeometry.all( 10)
//           ,child:GestureDetector(
//             onTap: ()async{
//               bool result =await FirebaseServices().SignInwithGoogle();


//               if (result) {
                
//               }else{}
//             },

// child: Row(mainAxisAlignment: MainAxisAlignment.center,
// children: [
//   Image.network("",height: 40 ,width: 25,fit: BoxFit.cover,)

//   ,SizedBox(width: 15,)

//   ,Text('data')
// ],),

//           ) ,)
          
//         ],
//       ) ,
//     );
//   }
// }