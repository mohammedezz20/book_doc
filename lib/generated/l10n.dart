// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Book Doc`
  String get Book_Doc {
    return Intl.message(
      'Book Doc',
      name: 'Book_Doc',
      desc: '',
      args: [],
    );
  }

  /// `Fill Your Profile`
  String get Fill_Your_Profile {
    return Intl.message(
      'Fill Your Profile',
      name: 'Fill_Your_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Please take a few minutes to fill out your profile with as much detail as possible.`
  String
      get Please_take_a_few_minutes_to_fill_out_your_profile_with_as_much_detail_as_possible {
    return Intl.message(
      'Please take a few minutes to fill out your profile with as much detail as possible.',
      name:
          'Please_take_a_few_minutes_to_fill_out_your_profile_with_as_much_detail_as_possible',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get Personal_Information {
    return Intl.message(
      'Personal Information',
      name: 'Personal_Information',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully.`
  String get Profile_updated_successfully {
    return Intl.message(
      'Profile updated successfully.',
      name: 'Profile_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get Full_Name {
    return Intl.message(
      'Full Name',
      name: 'Full_Name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Age {
    return Intl.message(
      'Age',
      name: 'Age',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get Languages {
    return Intl.message(
      'Languages',
      name: 'Languages',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get Are_you_sure_you_want_to_logout {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'Are_you_sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Signed out successfully`
  String get Signed_out_successfully {
    return Intl.message(
      'Signed out successfully',
      name: 'Signed_out_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `{exp1} founds`
  String founds(Object exp1) {
    return Intl.message(
      '$exp1 founds',
      name: 'founds',
      desc: '',
      args: [exp1],
    );
  }

  /// `There is no doctor with this name.`
  String get There_is_no_doctor_with_this_name {
    return Intl.message(
      'There is no doctor with this name.',
      name: 'There_is_no_doctor_with_this_name',
      desc: '',
      args: [],
    );
  }

  /// `Search for doctors`
  String get Search_for_doctors {
    return Intl.message(
      'Search for doctors',
      name: 'Search_for_doctors',
      desc: '',
      args: [],
    );
  }

  /// `search for doctors`
  String get search_for_doctors {
    return Intl.message(
      'search for doctors',
      name: 'search_for_doctors',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get Create_Account {
    return Intl.message(
      'Create Account',
      name: 'Create_Account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now and start exploring all that our app has to offer. We\re excited to welcome you to our community!`
  String
      get Sign_up_now_and_start_exploring_all_that_our_app_has_to_offer_We_e_excited_to_welcome_you_to_our_community {
    return Intl.message(
      'Sign up now and start exploring all that our app has to offer. We\re excited to welcome you to our community!',
      name:
          'Sign_up_now_and_start_exploring_all_that_our_app_has_to_offer_We_e_excited_to_welcome_you_to_our_community',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_Up {
    return Intl.message(
      'Sign Up',
      name: 'Sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `Do nott have an account yet?`
  String get Don_t_have_an_account_yet {
    return Intl.message(
      'Do nott have an account yet?',
      name: 'Don_t_have_an_account_yet',
      desc: '',
      args: [],
    );
  }

  /// `or sign in with`
  String get or_sign_in_with {
    return Intl.message(
      'or sign in with',
      name: 'or_sign_in_with',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get Already_have_an_account {
    return Intl.message(
      'Already have an account? ',
      name: 'Already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get Sign_in {
    return Intl.message(
      'Sign in',
      name: 'Sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get Welcome_Back {
    return Intl.message(
      'Welcome Back',
      name: 'Welcome_Back',
      desc: '',
      args: [],
    );
  }

  /// `We are excited to have you back, can't wait to see what you've been up to since you last logged in.`
  String
      get We_re_excited_to_have_you_back_can_t_wait_to_see_what_you_ve_been_up_to_since_you_last_logged_in {
    return Intl.message(
      'We are excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
      name:
          'We_re_excited_to_have_you_back_can_t_wait_to_see_what_you_ve_been_up_to_since_you_last_logged_in',
      desc: '',
      args: [],
    );
  }

  /// `By logging, you agree to our `
  String get By_logging_you_agree_to_our {
    return Intl.message(
      'By logging, you agree to our ',
      name: 'By_logging_you_agree_to_our',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get Terms_Conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'Terms_Conditions',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy.`
  String get Privacy_Policy {
    return Intl.message(
      'Privacy Policy.',
      name: 'Privacy_Policy',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get Forget_Password {
    return Intl.message(
      'Forget Password?',
      name: 'Forget_Password',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset`
  String get Password_Reset {
    return Intl.message(
      'Password Reset',
      name: 'Password_Reset',
      desc: '',
      args: [],
    );
  }

  /// `Check your Gmail inbox for password reset link !!!`
  String get Check_your_Gmail_inbox_for_password_reset_link {
    return Intl.message(
      'Check your Gmail inbox for password reset link !!!',
      name: 'Check_your_Gmail_inbox_for_password_reset_link',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get OK {
    return Intl.message(
      'OK',
      name: 'OK',
      desc: '',
      args: [],
    );
  }

  /// `At our app, we take the security of your information seriously.`
  String get At_our_app_we_take_the_security_of_your_information_seriously {
    return Intl.message(
      'At our app, we take the security of your information seriously.',
      name: 'At_our_app_we_take_the_security_of_your_information_seriously',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get Reset_Password {
    return Intl.message(
      'Reset Password',
      name: 'Reset_Password',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully!`
  String get Account_created_successfully {
    return Intl.message(
      'Account created successfully!',
      name: 'Account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get Confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'Confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Signed in successfully`
  String get Signed_in_successfully {
    return Intl.message(
      'Signed in successfully',
      name: 'Signed_in_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message(
      'About',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message(
      'Reviews',
      name: 'Reviews',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Doctors`
  String get Recommended_Doctors {
    return Intl.message(
      'Recommended Doctors',
      name: 'Recommended_Doctors',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get See_All {
    return Intl.message(
      'See All',
      name: 'See_All',
      desc: '',
      args: [],
    );
  }

  /// `Dr. {exp1}`
  String Dr(Object exp1) {
    return Intl.message(
      'Dr. $exp1',
      name: 'Dr',
      desc: '',
      args: [exp1],
    );
  }

  /// `{exp1} Specialist`
  String Specialist(Object exp1) {
    return Intl.message(
      '$exp1 Specialist',
      name: 'Specialist',
      desc: '',
      args: [exp1],
    );
  }

  /// `Doctor Speciality`
  String get Doctor_Speciality {
    return Intl.message(
      'Doctor Speciality',
      name: 'Doctor_Speciality',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get About_Me {
    return Intl.message(
      'About Me',
      name: 'About_Me',
      desc: '',
      args: [],
    );
  }

  /// `Working Time`
  String get Working_Time {
    return Intl.message(
      'Working Time',
      name: 'Working_Time',
      desc: '',
      args: [],
    );
  }

  /// `Monday - Friday: 9:00 AM - 5:00 PM`
  String get Monday_Friday_9_00_AM_5_00_PM {
    return Intl.message(
      'Monday - Friday: 9:00 AM - 5:00 PM',
      name: 'Monday_Friday_9_00_AM_5_00_PM',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get Contact_Information {
    return Intl.message(
      'Contact Information',
      name: 'Contact_Information',
      desc: '',
      args: [],
    );
  }

  /// `Error: {exp1}`
  String Error(Object exp1) {
    return Intl.message(
      'Error: $exp1',
      name: 'Error',
      desc: '',
      args: [exp1],
    );
  }

  /// `Upcoming`
  String get Upcoming {
    return Intl.message(
      'Upcoming',
      name: 'Upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get Completed {
    return Intl.message(
      'Completed',
      name: 'Completed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get Cancelled {
    return Intl.message(
      'Cancelled',
      name: 'Cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Appointment`
  String get Cancel_Appointment {
    return Intl.message(
      'Cancel Appointment',
      name: 'Cancel_Appointment',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule`
  String get Reschedule {
    return Intl.message(
      'Reschedule',
      name: 'Reschedule',
      desc: '',
      args: [],
    );
  }

  /// `My Appointments`
  String get My_Appointments {
    return Intl.message(
      'My Appointments',
      name: 'My_Appointments',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Cancelled`
  String get Appointment_Cancelled {
    return Intl.message(
      'Appointment Cancelled',
      name: 'Appointment_Cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Book Appointment`
  String get Book_Appointment {
    return Intl.message(
      'Book Appointment',
      name: 'Book_Appointment',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Information`
  String get Doctor_Information {
    return Intl.message(
      'Doctor Information',
      name: 'Doctor_Information',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Booked Successfully`
  String get Appointment_Booked_Successfully {
    return Intl.message(
      'Appointment Booked Successfully',
      name: 'Appointment_Booked_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Appointment updated successfully`
  String get Appointment_updated_successfully {
    return Intl.message(
      'Appointment updated successfully',
      name: 'Appointment_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get Book_Now {
    return Intl.message(
      'Book Now',
      name: 'Book_Now',
      desc: '',
      args: [],
    );
  }

  /// `Update Appointment`
  String get Update_Appointment {
    return Intl.message(
      'Update Appointment',
      name: 'Update_Appointment',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Upcoming`
  String get Appointment_Upcoming {
    return Intl.message(
      'Appointment Upcoming',
      name: 'Appointment_Upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule Appointment`
  String get Reschedule_Appointment {
    return Intl.message(
      'Reschedule Appointment',
      name: 'Reschedule_Appointment',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Date & Time`
  String get Date_Time {
    return Intl.message(
      'Date & Time',
      name: 'Date_Time',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get Summary {
    return Intl.message(
      'Summary',
      name: 'Summary',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get Select_Date {
    return Intl.message(
      'Select Date',
      name: 'Select_Date',
      desc: '',
      args: [],
    );
  }

  /// `Available Time`
  String get Available_Time {
    return Intl.message(
      'Available Time',
      name: 'Available_Time',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Type`
  String get Appointment_Type {
    return Intl.message(
      'Appointment Type',
      name: 'Appointment_Type',
      desc: '',
      args: [],
    );
  }

  /// `Booking Confirmed`
  String get Booking_Confirmed {
    return Intl.message(
      'Booking Confirmed',
      name: 'Booking_Confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Book Information`
  String get Book_Information {
    return Intl.message(
      'Book Information',
      name: 'Book_Information',
      desc: '',
      args: [],
    );
  }

  /// `Hi, {exp1} !`
  String Hi(Object exp1) {
    return Intl.message(
      'Hi, $exp1 !',
      name: 'Hi',
      desc: '',
      args: [exp1],
    );
  }

  /// `Make An Appointment`
  String get Make_An_Appointment {
    return Intl.message(
      'Make An Appointment',
      name: 'Make_An_Appointment',
      desc: '',
      args: [],
    );
  }

  /// `EG`
  String get EG {
    return Intl.message(
      'EG',
      name: 'EG',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Number`
  String get WhatsApp_Number {
    return Intl.message(
      'WhatsApp Number',
      name: 'WhatsApp_Number',
      desc: '',
      args: [],
    );
  }

  /// `Search country`
  String get Search_country {
    return Intl.message(
      'Search country',
      name: 'Search_country',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
