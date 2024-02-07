
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phnotp1/otp_screen.dart';


class Phone_Auth extends StatefulWidget {
  const Phone_Auth({super.key});

  @override
  State<Phone_Auth> createState() => _Phone_AuthState();
}

class _Phone_AuthState extends State<Phone_Auth> {

  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text= "+91";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),

                    SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countrycode,
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),

                    Text("|",style: TextStyle(fontSize: 33,color: Colors.grey),),

                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value){
                        phone=value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "enter your mobile number"
                      ),
                    )),

                  ],
                ),
              ),



              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(onPressed: () async {

                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countrycode.text+phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Otp_screen(verificationid: verificationId,)),
                      );

                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );







                },


                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    ),

                    child:Text("send the code",style: TextStyle(color: Colors.white),)),
              )
              
            ],
          ),
        ),
      ),

    );
  }
}
