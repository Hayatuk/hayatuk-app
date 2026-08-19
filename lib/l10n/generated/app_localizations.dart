import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Turn on location services to find nearby requests'**
  String get locationServicesDisabled;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Hayatuk needs your location to find nearby blood requests'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Location is disabled. Enable it in your phone settings to use the app.'**
  String get locationPermissionDeniedForever;

  /// No description provided for @locationTimeout.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t get your location. Check that location is on and try again.'**
  String get locationTimeout;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @loginDontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Register'**
  String get loginDontHaveAccount;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerTitle;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get registerButton;

  /// No description provided for @termsAgreementPrefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get termsAgreementPrefix;

  /// No description provided for @termsAgreementConjunction.
  ///
  /// In en, this message translates to:
  /// **' and the '**
  String get termsAgreementConjunction;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsAcceptRequired.
  ///
  /// In en, this message translates to:
  /// **'You must accept the Terms of Use and Privacy Policy'**
  String get termsAcceptRequired;

  /// No description provided for @registerHasAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get registerHasAccount;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get emailInvalid;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHelperMinChars.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get passwordHelperMinChars;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordTooShort;

  /// No description provided for @bloodType.
  ///
  /// In en, this message translates to:
  /// **'Blood type'**
  String get bloodType;

  /// No description provided for @phoneOptional.
  ///
  /// In en, this message translates to:
  /// **'Phone (optional)'**
  String get phoneOptional;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @bloodRequest.
  ///
  /// In en, this message translates to:
  /// **'Blood request'**
  String get bloodRequest;

  /// No description provided for @kmAway.
  ///
  /// In en, this message translates to:
  /// **'{distance} km away'**
  String kmAway(String distance);

  /// No description provided for @donorsCount.
  ///
  /// In en, this message translates to:
  /// **'{accepted}/{needed} donors'**
  String donorsCount(int accepted, int needed);

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @newBloodRequest.
  ///
  /// In en, this message translates to:
  /// **'New blood request'**
  String get newBloodRequest;

  /// No description provided for @donorModeOff.
  ///
  /// In en, this message translates to:
  /// **'Donor mode is off'**
  String get donorModeOff;

  /// No description provided for @donorModeOffHint.
  ///
  /// In en, this message translates to:
  /// **'Turn on donor mode in your profile to see nearby requests.'**
  String get donorModeOffHint;

  /// No description provided for @onCooldownTitle.
  ///
  /// In en, this message translates to:
  /// **'On cooldown'**
  String get onCooldownTitle;

  /// No description provided for @onCooldownBody.
  ///
  /// In en, this message translates to:
  /// **'You can donate again on {date}'**
  String onCooldownBody(String date);

  /// No description provided for @pendingDonationTitle.
  ///
  /// In en, this message translates to:
  /// **'Pending donation'**
  String get pendingDonationTitle;

  /// No description provided for @pendingDonationBody.
  ///
  /// In en, this message translates to:
  /// **'Complete your current acceptance before taking another.'**
  String get pendingDonationBody;

  /// No description provided for @noNearbyRequests.
  ///
  /// In en, this message translates to:
  /// **'No nearby requests'**
  String get noNearbyRequests;

  /// No description provided for @noNearbyRequestsHint.
  ///
  /// In en, this message translates to:
  /// **'You\'ll be notified when one appears.'**
  String get noNearbyRequestsHint;

  /// No description provided for @requestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requestsTitle;

  /// No description provided for @newRequest.
  ///
  /// In en, this message translates to:
  /// **'Request blood'**
  String get newRequest;

  /// No description provided for @noRequestsYet.
  ///
  /// In en, this message translates to:
  /// **'No requests yet.\nTap the button to request blood.'**
  String get noRequestsYet;

  /// No description provided for @sectionActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get sectionActive;

  /// No description provided for @sectionPast.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get sectionPast;

  /// No description provided for @timeJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get timeJustNow;

  /// No description provided for @timeMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String timeMinutesAgo(int minutes);

  /// No description provided for @timeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String timeHoursAgo(int hours);

  /// No description provided for @timeDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String timeDaysAgo(int days);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cancelRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel request?'**
  String get cancelRequestTitle;

  /// No description provided for @cancelRequestContent.
  ///
  /// In en, this message translates to:
  /// **'This will stop the search for donors.'**
  String get cancelRequestContent;

  /// No description provided for @keep.
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get keep;

  /// No description provided for @cancelRequestButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel request'**
  String get cancelRequestButton;

  /// No description provided for @statusSearching.
  ///
  /// In en, this message translates to:
  /// **'Searching for donors'**
  String get statusSearching;

  /// No description provided for @statusInProgress.
  ///
  /// In en, this message translates to:
  /// **'Donors confirmed'**
  String get statusInProgress;

  /// No description provided for @statusFulfilled.
  ///
  /// In en, this message translates to:
  /// **'Fulfilled'**
  String get statusFulfilled;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @statusUnfulfilled.
  ///
  /// In en, this message translates to:
  /// **'No donor found'**
  String get statusUnfulfilled;

  /// No description provided for @createRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Request blood'**
  String get createRequestTitle;

  /// No description provided for @unitsNeeded.
  ///
  /// In en, this message translates to:
  /// **'Units needed'**
  String get unitsNeeded;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'Contact phone'**
  String get contactPhone;

  /// No description provided for @contactPhoneHelper.
  ///
  /// In en, this message translates to:
  /// **'Donors will call this number (9-11 digits)'**
  String get contactPhoneHelper;

  /// No description provided for @phoneRequiredDigits.
  ///
  /// In en, this message translates to:
  /// **'Must be 9-11 digits'**
  String get phoneRequiredDigits;

  /// No description provided for @phoneDigitsOnly.
  ///
  /// In en, this message translates to:
  /// **'Digits only'**
  String get phoneDigitsOnly;

  /// No description provided for @notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get notesOptional;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Hospital name, room, etc.'**
  String get notesHint;

  /// No description provided for @createRequestButton.
  ///
  /// In en, this message translates to:
  /// **'Create request'**
  String get createRequestButton;

  /// No description provided for @locationCaptured.
  ///
  /// In en, this message translates to:
  /// **'Location captured'**
  String get locationCaptured;

  /// No description provided for @useMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Use my location'**
  String get useMyLocation;

  /// No description provided for @productWholeBlood.
  ///
  /// In en, this message translates to:
  /// **'Whole blood'**
  String get productWholeBlood;

  /// No description provided for @productPlatelets.
  ///
  /// In en, this message translates to:
  /// **'Platelets'**
  String get productPlatelets;

  /// No description provided for @requestDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get requestDetailTitle;

  /// No description provided for @donors.
  ///
  /// In en, this message translates to:
  /// **'Donors'**
  String get donors;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @productLabel.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productLabel;

  /// No description provided for @postedLabel.
  ///
  /// In en, this message translates to:
  /// **'Posted'**
  String get postedLabel;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabel;

  /// No description provided for @acceptRequest.
  ///
  /// In en, this message translates to:
  /// **'Accept request'**
  String get acceptRequest;

  /// No description provided for @yourOwnRequest.
  ///
  /// In en, this message translates to:
  /// **'This is your own request'**
  String get yourOwnRequest;

  /// No description provided for @acceptFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to accept'**
  String get acceptFailed;

  /// No description provided for @acceptSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re committed'**
  String get acceptSuccessTitle;

  /// No description provided for @acceptSuccessLead.
  ///
  /// In en, this message translates to:
  /// **'Thank you for accepting. Here\'s what to do next:'**
  String get acceptSuccessLead;

  /// No description provided for @acceptStep1.
  ///
  /// In en, this message translates to:
  /// **'Call the requester to coordinate when and where to meet.'**
  String get acceptStep1;

  /// No description provided for @acceptStep2.
  ///
  /// In en, this message translates to:
  /// **'Go to the meeting point and donate.'**
  String get acceptStep2;

  /// No description provided for @acceptStep3.
  ///
  /// In en, this message translates to:
  /// **'Tap \"I donated\" in the Donations tab when finished.'**
  String get acceptStep3;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @donationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Donations'**
  String get donationsTitle;

  /// No description provided for @noAcceptancesYet.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t accepted any requests yet.'**
  String get noAcceptancesYet;

  /// No description provided for @sectionPending.
  ///
  /// In en, this message translates to:
  /// **'Pending donation'**
  String get sectionPending;

  /// No description provided for @sectionDonated.
  ///
  /// In en, this message translates to:
  /// **'Donated'**
  String get sectionDonated;

  /// No description provided for @acceptedOn.
  ///
  /// In en, this message translates to:
  /// **'Accepted • {date}'**
  String acceptedOn(String date);

  /// No description provided for @donatedOn.
  ///
  /// In en, this message translates to:
  /// **'Donated • {date}'**
  String donatedOn(String date);

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @iDonated.
  ///
  /// In en, this message translates to:
  /// **'I donated'**
  String get iDonated;

  /// No description provided for @confirmDonationTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm donation'**
  String get confirmDonationTitle;

  /// No description provided for @confirmDonationContent.
  ///
  /// In en, this message translates to:
  /// **'Confirm you donated blood for this request? This will start your cooldown.'**
  String get confirmDonationContent;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @donationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to record donation'**
  String get donationFailed;

  /// No description provided for @cancelAcceptanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel your acceptance?'**
  String get cancelAcceptanceTitle;

  /// No description provided for @cancelAcceptanceContent.
  ///
  /// In en, this message translates to:
  /// **'The requester will be notified and the request will look for another donor.'**
  String get cancelAcceptanceContent;

  /// No description provided for @cancelAcceptanceButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel acceptance'**
  String get cancelAcceptanceButton;

  /// No description provided for @cancelAcceptanceFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel acceptance'**
  String get cancelAcceptanceFailed;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Logout?'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmContent.
  ///
  /// In en, this message translates to:
  /// **'You will need to login again.'**
  String get logoutConfirmContent;

  /// No description provided for @deleteAccountConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account?'**
  String get deleteAccountConfirmTitle;

  /// No description provided for @deleteAccountConfirmContent.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete your account and all your data. This cannot be undone.'**
  String get deleteAccountConfirmContent;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @availableAgainOn.
  ///
  /// In en, this message translates to:
  /// **'Available again on {date}'**
  String availableAgainOn(String date);

  /// No description provided for @availableToDonate.
  ///
  /// In en, this message translates to:
  /// **'Available to donate'**
  String get availableToDonate;

  /// No description provided for @mayReceiveRequests.
  ///
  /// In en, this message translates to:
  /// **'You may receive blood requests'**
  String get mayReceiveRequests;

  /// No description provided for @wontBeNotified.
  ///
  /// In en, this message translates to:
  /// **'You won\'t be notified'**
  String get wontBeNotified;

  /// No description provided for @notificationsRequiredForDonor.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications in your device settings to receive blood requests.'**
  String get notificationsRequiredForDonor;

  /// No description provided for @editProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfileTitle;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileUpdated;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabRequests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get tabRequests;

  /// No description provided for @tabDonations.
  ///
  /// In en, this message translates to:
  /// **'Donations'**
  String get tabDonations;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email. We\'ll send you a code to reset your password.'**
  String get forgotPasswordHint;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// No description provided for @resetCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter reset code'**
  String get resetCodeTitle;

  /// No description provided for @resetCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Check your email for the 6-digit code.'**
  String get resetCodeHint;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @passwordReset.
  ///
  /// In en, this message translates to:
  /// **'Password reset. You can log in now.'**
  String get passwordReset;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid or expired code'**
  String get invalidCode;

  /// No description provided for @codeSent.
  ///
  /// In en, this message translates to:
  /// **'If the email is registered, a code has been sent.'**
  String get codeSent;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordTitle;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmNewPassword;

  /// No description provided for @passwordsDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwordsDontMatch;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password changed'**
  String get passwordChanged;

  /// No description provided for @selfCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick self-check'**
  String get selfCheckTitle;

  /// No description provided for @selfCheckLead.
  ///
  /// In en, this message translates to:
  /// **'Before you commit, confirm you can donate today:'**
  String get selfCheckLead;

  /// No description provided for @selfCheckHealthy.
  ///
  /// In en, this message translates to:
  /// **'I\'m feeling healthy today'**
  String get selfCheckHealthy;

  /// No description provided for @selfCheckAge.
  ///
  /// In en, this message translates to:
  /// **'I\'m 18 or older'**
  String get selfCheckAge;

  /// No description provided for @selfCheckWeight.
  ///
  /// In en, this message translates to:
  /// **'I weigh at least 50 kg'**
  String get selfCheckWeight;

  /// No description provided for @selfCheckSleep.
  ///
  /// In en, this message translates to:
  /// **'I slept well last night'**
  String get selfCheckSleep;

  /// No description provided for @selfCheckCooldownOk.
  ///
  /// In en, this message translates to:
  /// **'You\'re past your donation cooldown'**
  String get selfCheckCooldownOk;

  /// No description provided for @selfCheckCooldownUnknown.
  ///
  /// In en, this message translates to:
  /// **'If you\'ve donated before, tell the staff when it was'**
  String get selfCheckCooldownUnknown;

  /// No description provided for @selfCheckBlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re not eligible yet'**
  String get selfCheckBlockedTitle;

  /// No description provided for @selfCheckBlockedBody.
  ///
  /// In en, this message translates to:
  /// **'You can donate again on {date}'**
  String selfCheckBlockedBody(String date);

  /// No description provided for @selfCheckConfirm.
  ///
  /// In en, this message translates to:
  /// **'I\'m ready — accept'**
  String get selfCheckConfirm;

  /// No description provided for @prepGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Before you go'**
  String get prepGuideTitle;

  /// No description provided for @prepGuideEat.
  ///
  /// In en, this message translates to:
  /// **'Eat a full meal'**
  String get prepGuideEat;

  /// No description provided for @prepGuideWater.
  ///
  /// In en, this message translates to:
  /// **'Drink plenty of water'**
  String get prepGuideWater;

  /// No description provided for @prepGuideSleeves.
  ///
  /// In en, this message translates to:
  /// **'Wear short sleeves'**
  String get prepGuideSleeves;

  /// No description provided for @prepGuideId.
  ///
  /// In en, this message translates to:
  /// **'Bring your ID'**
  String get prepGuideId;

  /// No description provided for @prepGuideCall.
  ///
  /// In en, this message translates to:
  /// **'Call the requester to coordinate when and where to meet'**
  String get prepGuideCall;

  /// No description provided for @prepGuideDisclose.
  ///
  /// In en, this message translates to:
  /// **'Tell the staff if you\'ve been sick in the last 15 days or take any medication'**
  String get prepGuideDisclose;

  /// No description provided for @duringGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'At the donation center'**
  String get duringGuideTitle;

  /// No description provided for @duringGuideRelax.
  ///
  /// In en, this message translates to:
  /// **'Stay relaxed'**
  String get duringGuideRelax;

  /// No description provided for @duringGuideArm.
  ///
  /// In en, this message translates to:
  /// **'Keep your arm still'**
  String get duringGuideArm;

  /// No description provided for @duringGuideSpeakUp.
  ///
  /// In en, this message translates to:
  /// **'Tell the nurse if anything feels wrong'**
  String get duringGuideSpeakUp;

  /// No description provided for @duringGuideRecord.
  ///
  /// In en, this message translates to:
  /// **'Tap \"I donated\" in the Donations tab when finished'**
  String get duringGuideRecord;

  /// No description provided for @aftercareTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re a hero! ❤️'**
  String get aftercareTitle;

  /// No description provided for @aftercareLead.
  ///
  /// In en, this message translates to:
  /// **'Take care of yourself for the rest of the day:'**
  String get aftercareLead;

  /// No description provided for @aftercareWater.
  ///
  /// In en, this message translates to:
  /// **'Drink extra water'**
  String get aftercareWater;

  /// No description provided for @aftercareSnack.
  ///
  /// In en, this message translates to:
  /// **'Have a snack'**
  String get aftercareSnack;

  /// No description provided for @aftercareNoLifting.
  ///
  /// In en, this message translates to:
  /// **'No heavy lifting today'**
  String get aftercareNoLifting;

  /// No description provided for @aftercareNoExercise.
  ///
  /// In en, this message translates to:
  /// **'Skip intense exercise today'**
  String get aftercareNoExercise;

  /// No description provided for @aftercareEligibleAgain.
  ///
  /// In en, this message translates to:
  /// **'You\'ll be eligible to donate again on {date}'**
  String aftercareEligibleAgain(String date);

  /// No description provided for @hospital.
  ///
  /// In en, this message translates to:
  /// **'Hospital'**
  String get hospital;

  /// No description provided for @hospitalHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. CHU Batna'**
  String get hospitalHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
