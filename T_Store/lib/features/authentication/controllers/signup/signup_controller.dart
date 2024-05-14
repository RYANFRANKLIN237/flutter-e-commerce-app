import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/constraints/image_strings.dart';
import 'package:t_store/utils/helpers/loaders.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs; //observable for hiding/showing password
  final privacyPolicy = true.obs; //observable for privacy policy acceptance
  final email = TextEditingController(); //controller for email input
  final lastName = TextEditingController(); //controller for lastname input
  final username = TextEditingController(); //controller for username input
  final password = TextEditingController(); //controller for password input
  final firstName = TextEditingController(); //controller for firstname input
  final phoneNumber =
      TextEditingController(); //controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation

  ///Sign up
  void signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept privacy policy',
          message:
              'In order to create an account you must accept privacy policy & terms of use',
        );
        return;
      }

      // register user in the firebase authentication and save user details in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated new data in firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      TFullScreenLoader.stopLoading();


      // show success snack bar
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created verify email to continue');

      // move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();

      //show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
