
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:phnotp1/hm.dart';
import 'package:pinput/pinput.dart';

 class Otp_screen extends StatefulWidget {
   String verificationid;
    Otp_screen({super.key, required this.verificationid});

   @override
   State<Otp_screen> createState() => _Otp_screenState();
 }

 class _Otp_screenState extends State<Otp_screen> {


   final FirebaseAuth auth = FirebaseAuth.instance;


   @override
   Widget build(BuildContext context) {

     TextEditingController otpctrl = TextEditingController();

     final defaultPinTheme = PinTheme(
       width: 56,
       height: 56,
       textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
       decoration: BoxDecoration(
         border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
         borderRadius: BorderRadius.circular(20),
       ),
     );

     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
       border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
       borderRadius: BorderRadius.circular(8),
     );

     final submittedPinTheme = defaultPinTheme.copyWith(
       decoration: defaultPinTheme.decoration?.copyWith(
         color: Color.fromRGBO(234, 239, 243, 1),
       ),
     );

     return  Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         elevation: 0, 
         leading: IconButton(onPressed: () {
           Navigator.pop(context);

         }, icon: Icon(Icons.arrow_back)),
       ),
       body: Container(
         margin: EdgeInsets.only(left: 25,right: 25),
         alignment: Alignment.center,
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               Image.asset("assets/images/img.png",height: 150,width: 150,),
               SizedBox(
                 height: 20,
               ),

               Text("Phone Verification",style: TextStyle(
                 fontSize: 22,fontWeight: FontWeight.bold,
               ),),
               SizedBox(
                 height: 10,
               ),
               Text("We need to register your phone before getting started !",
                 style: TextStyle(
                   fontSize: 16,

                 ),
                 textAlign: TextAlign.center,
               ),

               SizedBox(
                 height: 45,
               ),

           Pinput(
             controller: otpctrl,
             defaultPinTheme: defaultPinTheme,
             focusedPinTheme: focusedPinTheme,
             submittedPinTheme: submittedPinTheme,
             length: 6,
             
             showCursor: true,

           ),



               SizedBox(
                 height: 20,
               ),

               SizedBox(
                 height: 45,
                 width: double.infinity,
                 child: ElevatedButton(onPressed: () async{

                 try{
                   // Create a PhoneAuthCredential with the code
                   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: otpctrl.text.toString());

                   // Sign the user in (or link) with the credential
                   await auth.signInWithCredential(credential).then((value) {

                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Hmm()),
                     );

                   });

                 }catch(e){
                  print("error otp");
                 }


                 },
                     style: ElevatedButton.styleFrom(
                         primary: Colors.green.shade600,
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.0)
                         )
                     ),

                     child:Text("verify phone number",style: TextStyle(color: Colors.white),)),
               ),
               SizedBox(
                 height: 10,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   TextButton(onPressed: () {

                     Navigator.pop(context);

                   }, child:Text("Edit phone number?",
                     style: TextStyle(color: Colors.black),)),
                 ],
               )

             ],
           ),
         ),
       ),

     );
   }
 }

