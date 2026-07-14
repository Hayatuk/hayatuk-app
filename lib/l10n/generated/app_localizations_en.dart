// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get locationServicesDisabled =>
      'Turn on location services to find nearby requests';

  @override
  String get locationPermissionDenied =>
      'Hayatuk needs your location to find nearby blood requests';

  @override
  String get locationPermissionDeniedForever =>
      'Location is disabled. Enable it in your phone settings to use the app.';

  @override
  String get locationTimeout =>
      'Couldn\'t get your location. Check that location is on and try again.';

  @override
  String get loginTitle => 'Login';

  @override
  String get loginButton => 'Login';

  @override
  String get loginDontHaveAccount => 'Don\'t have an account? Register';

  @override
  String get registerTitle => 'Register';

  @override
  String get registerButton => 'Create account';

  @override
  String get registerHasAccount => 'Already have an account? Login';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Invalid email';

  @override
  String get password => 'Password';

  @override
  String get passwordHelperMinChars => 'At least 8 characters';

  @override
  String get passwordTooShort => 'Password must be at least 8 characters';

  @override
  String get bloodType => 'Blood type';

  @override
  String get phoneOptional => 'Phone (optional)';

  @override
  String get required => 'Required';

  @override
  String get retry => 'Retry';

  @override
  String get bloodRequest => 'Blood request';

  @override
  String kmAway(String distance) {
    return '$distance km away';
  }

  @override
  String donorsCount(int accepted, int needed) {
    return '$accepted/$needed donors';
  }

  @override
  String get viewDetails => 'View details';

  @override
  String get view => 'View';

  @override
  String get newBloodRequest => 'New blood request';

  @override
  String get donorModeOff => 'Donor mode is off';

  @override
  String get donorModeOffHint =>
      'Turn on donor mode in your profile to see nearby requests.';

  @override
  String get onCooldownTitle => 'On cooldown';

  @override
  String onCooldownBody(String date) {
    return 'You can donate again on $date';
  }

  @override
  String get pendingDonationTitle => 'Pending donation';

  @override
  String get pendingDonationBody =>
      'Complete your current acceptance before taking another.';

  @override
  String get noNearbyRequests => 'No nearby requests';

  @override
  String get noNearbyRequestsHint => 'You\'ll be notified when one appears.';

  @override
  String get requestsTitle => 'Requests';

  @override
  String get newRequest => 'Request blood';

  @override
  String get noRequestsYet =>
      'No requests yet.\nTap the button to request blood.';

  @override
  String get sectionActive => 'Active';

  @override
  String get sectionPast => 'Past';

  @override
  String get cancel => 'Cancel';

  @override
  String get cancelRequestTitle => 'Cancel request?';

  @override
  String get cancelRequestContent => 'This will stop the search for donors.';

  @override
  String get keep => 'Keep';

  @override
  String get cancelRequestButton => 'Cancel request';

  @override
  String get statusSearching => 'Searching for donors';

  @override
  String get statusInProgress => 'Donors confirmed';

  @override
  String get statusFulfilled => 'Fulfilled';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get statusUnfulfilled => 'No donor found';

  @override
  String get createRequestTitle => 'Request blood';

  @override
  String get unitsNeeded => 'Units needed';

  @override
  String get contactPhone => 'Contact phone';

  @override
  String get contactPhoneHelper => 'Donors will call this number (9-11 digits)';

  @override
  String get phoneRequiredDigits => 'Must be 9-11 digits';

  @override
  String get phoneDigitsOnly => 'Digits only';

  @override
  String get notesOptional => 'Notes (optional)';

  @override
  String get notesHint => 'Hospital name, room, etc.';

  @override
  String get createRequestButton => 'Create request';

  @override
  String get locationCaptured => 'Location captured';

  @override
  String get useMyLocation => 'Use my location';

  @override
  String get productWholeBlood => 'Whole blood';

  @override
  String get productPlatelets => 'Platelets';

  @override
  String get requestDetailTitle => 'Request';

  @override
  String get donors => 'Donors';

  @override
  String get locationLabel => 'Location';

  @override
  String get acceptRequest => 'Accept request';

  @override
  String get yourOwnRequest => 'This is your own request';

  @override
  String get acceptFailed => 'Failed to accept';

  @override
  String get gotIt => 'Got it';

  @override
  String get donationsTitle => 'Donations';

  @override
  String get noAcceptancesYet => 'You haven\'t accepted any requests yet.';

  @override
  String get sectionPending => 'Pending donation';

  @override
  String get sectionDonated => 'Donated';

  @override
  String acceptedOn(String date) {
    return 'Accepted • $date';
  }

  @override
  String donatedOn(String date) {
    return 'Donated • $date';
  }

  @override
  String get call => 'Call';

  @override
  String get iDonated => 'I donated';

  @override
  String get confirmDonationTitle => 'Confirm donation';

  @override
  String get confirmDonationContent =>
      'Confirm you donated blood for this request? This will start your cooldown.';

  @override
  String get confirm => 'Confirm';

  @override
  String get donationFailed => 'Failed to record donation';

  @override
  String get profileTitle => 'Profile';

  @override
  String get editProfile => 'Edit profile';

  @override
  String get logout => 'Logout';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get logoutConfirmTitle => 'Logout?';

  @override
  String get logoutConfirmContent => 'You will need to login again.';

  @override
  String get deleteAccountConfirmTitle => 'Delete account?';

  @override
  String get deleteAccountConfirmContent =>
      'This will permanently delete your account and all your data. This cannot be undone.';

  @override
  String get delete => 'Delete';

  @override
  String availableAgainOn(String date) {
    return 'Available again on $date';
  }

  @override
  String get availableToDonate => 'Available to donate';

  @override
  String get mayReceiveRequests => 'You may receive blood requests';

  @override
  String get wontBeNotified => 'You won\'t be notified';

  @override
  String get editProfileTitle => 'Edit Profile';

  @override
  String get save => 'Save';

  @override
  String get profileUpdated => 'Profile updated';

  @override
  String get tabHome => 'Home';

  @override
  String get tabRequests => 'Requests';

  @override
  String get tabDonations => 'Donations';

  @override
  String get tabProfile => 'Profile';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get forgotPasswordTitle => 'Reset password';

  @override
  String get forgotPasswordHint =>
      'Enter your email. We\'ll send you a code to reset your password.';

  @override
  String get sendCode => 'Send code';

  @override
  String get resetCodeTitle => 'Enter reset code';

  @override
  String get resetCodeHint => 'Check your email for the 6-digit code.';

  @override
  String get code => 'Code';

  @override
  String get newPassword => 'New password';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get passwordReset => 'Password reset. You can log in now.';

  @override
  String get invalidCode => 'Invalid or expired code';

  @override
  String get codeSent => 'If the email is registered, a code has been sent.';

  @override
  String get language => 'Language';

  @override
  String get systemDefault => 'System default';

  @override
  String get changePassword => 'Change password';

  @override
  String get changePasswordTitle => 'Change password';

  @override
  String get currentPassword => 'Current password';

  @override
  String get confirmNewPassword => 'Confirm new password';

  @override
  String get passwordsDontMatch => 'Passwords don\'t match';

  @override
  String get passwordChanged => 'Password changed';

  @override
  String get selfCheckTitle => 'Quick self-check';

  @override
  String get selfCheckLead =>
      'Before you commit, confirm you can donate today:';

  @override
  String get selfCheckHealthy => 'I\'m feeling healthy today';

  @override
  String get selfCheckAge => 'I\'m 18 or older';

  @override
  String get selfCheckWeight => 'I weigh at least 50 kg';

  @override
  String get selfCheckSleep => 'I slept well last night';

  @override
  String get selfCheckCooldownOk => 'You\'re past your donation cooldown';

  @override
  String get selfCheckCooldownUnknown =>
      'If you\'ve donated before, tell the staff when it was';

  @override
  String get selfCheckBlockedTitle => 'You\'re not eligible yet';

  @override
  String selfCheckBlockedBody(String date) {
    return 'You can donate again on $date';
  }

  @override
  String get selfCheckConfirm => 'I\'m ready — accept';

  @override
  String get prepGuideTitle => 'Before you go';

  @override
  String get prepGuideEat => 'Eat a full meal';

  @override
  String get prepGuideWater => 'Drink plenty of water';

  @override
  String get prepGuideSleeves => 'Wear short sleeves';

  @override
  String get prepGuideId => 'Bring your ID';

  @override
  String get prepGuideCall =>
      'Call the requester to coordinate when and where to meet';

  @override
  String get prepGuideDisclose =>
      'Tell the staff if you\'ve been sick in the last 15 days or take any medication';

  @override
  String get duringGuideTitle => 'At the donation center';

  @override
  String get duringGuideRelax => 'Stay relaxed';

  @override
  String get duringGuideArm => 'Keep your arm still';

  @override
  String get duringGuideSpeakUp => 'Tell the nurse if anything feels wrong';

  @override
  String get duringGuideRecord =>
      'Tap \"I donated\" in the Donations tab when finished';

  @override
  String get aftercareTitle => 'You\'re a hero! ❤️';

  @override
  String get aftercareLead => 'Take care of yourself for the rest of the day:';

  @override
  String get aftercareWater => 'Drink extra water';

  @override
  String get aftercareSnack => 'Have a snack';

  @override
  String get aftercareNoLifting => 'No heavy lifting today';

  @override
  String get aftercareNoExercise => 'Skip intense exercise today';

  @override
  String aftercareEligibleAgain(String date) {
    return 'You\'ll be eligible to donate again on $date';
  }
}
