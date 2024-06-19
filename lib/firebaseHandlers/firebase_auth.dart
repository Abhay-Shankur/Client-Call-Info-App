import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHandler {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  late BuildContext context;
  static late String _verificationId;
  FirebaseAuthHandler({required this.context});

  Future<bool> checkLoginStatus() async {
    try {
      // Get the current user from Firebase Authentication
      User? user = _auth.currentUser;
      // Return true if user is not null (authenticated), otherwise return false
      return user != null;
    } catch (e) {
      // Handle any errors that occur during the process
      debugPrint('Error checking login status: $e');
      return false; // Return false in case of errors
    }
  }

  // Sign in with phone number
  Future<void> beginPhoneAuth(String phoneNumber, void Function() callback) async {
    if(phoneNumber.length == 10) phoneNumber = '+91 $phoneNumber';
    debugPrint('Phone Number $phoneNumber');
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        switch(e.code){
          case 'invalid-verification-code':
            _showSnackBar('${e.message}');
            break;
          case 'session-expired':
            _showSnackBar('${e.message}');
            break;
          case 'network-request-failed':
            _showSnackBar('${e.message}');
            break;
          case 'too-many-requests':
            _showSnackBar('${e.message}');
            break;
          case 'missing-client-identifier':
            _showSnackBar('${e.message}');
          default:
            _showSnackBar('Verification Failed');
            throw FormatException('Verification Failed: $e');
        }
        debugPrint('Verification Failed: $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        debugPrint('Verification Id in signInWithPhoneNumber: $_verificationId');
        _showSnackBar('OTP sent Successfully');
        callback();
        // Navigator.pushReplacement(
        //   context,
        //   //TODO AUTH SCREEN
        //   // MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId,)),
        // );
        // onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint('Code Auto Retrieval Timeout');
      },
      timeout: const Duration(seconds: 60),
    );
  }

  // // Sign in with verification code
  // Future<UserCredential?> signInWithVerificationCode(String verificationId, String code) async {
  //   try {
  //     debugPrint('Verification Id in signInWithVerificationCode: $verificationId');
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
  //     return await _auth.signInWithCredential(credential);
  //   } catch (e) {
  //     debugPrint('Error signing in with verification code: $e');
  //     _showSnackBar('Error in OTP Verification');
  //     return null;
  //   }
  // }

  // Sign in with verification code
  Future<UserCredential?> verifySmsCode(String code) async {
    try {
      debugPrint('Verification Id in signInWithVerificationCode: $_verificationId');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: code);
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint('Error signing in with verification code: $e');
      _showSnackBar('Error in OTP Verification');
      return null;
    }
  }

  // Get the current signed-in user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }

  static String? getUid() {
    return _auth.currentUser?.uid;
  }

  // Get user details
  Future<User?> getUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await user.reload();
      return _auth.currentUser;
    }
    return null;
  }

  // Sign out
  Future<void> signOut(void Function() callback) async {
    await _auth.signOut();
    callback();
  }

  void _showSnackBar( String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3), // Adjust the duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
