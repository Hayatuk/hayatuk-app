// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get locationServicesDisabled =>
      'قم بتفعيل خدمات الموقع لرؤية الطلبات القريبة';

  @override
  String get locationPermissionDenied =>
      'يحتاج حياتك إلى موقعك للعثور على الطلبات القريبة';

  @override
  String get locationPermissionDeniedForever =>
      'الموقع معطل. قم بتفعيله من إعدادات الهاتف لاستخدام التطبيق.';

  @override
  String get locationTimeout =>
      'تعذّر تحديد موقعك. تأكد من تفعيل الموقع وحاول مرة أخرى.';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get loginDontHaveAccount => 'ليس لديك حساب؟ إنشاء حساب';

  @override
  String get registerTitle => 'إنشاء حساب';

  @override
  String get registerButton => 'إنشاء الحساب';

  @override
  String get termsAgreementPrefix => 'أوافق على ';

  @override
  String get termsAgreementConjunction => ' و';

  @override
  String get termsOfUse => 'شروط الاستخدام';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsAcceptRequired =>
      'يجب الموافقة على شروط الاستخدام وسياسة الخصوصية';

  @override
  String get registerHasAccount => 'لديك حساب؟ تسجيل الدخول';

  @override
  String get name => 'الاسم';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailInvalid => 'بريد إلكتروني غير صالح';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordHelperMinChars => '8 أحرف على الأقل';

  @override
  String get passwordTooShort => 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';

  @override
  String get bloodType => 'فصيلة الدم';

  @override
  String get phoneOptional => 'الهاتف (اختياري)';

  @override
  String get required => 'مطلوب';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get bloodRequest => 'طلب دم';

  @override
  String kmAway(String distance) {
    return 'على بعد $distance كم';
  }

  @override
  String donorsCount(int accepted, int needed) {
    return '$accepted/$needed متبرعين';
  }

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get view => 'عرض';

  @override
  String get newBloodRequest => 'طلب دم جديد';

  @override
  String get donorModeOff => 'وضع التبرع متوقف';

  @override
  String get donorModeOffHint =>
      'قم بتفعيل وضع التبرع في ملفك الشخصي لرؤية الطلبات.';

  @override
  String get onCooldownTitle => 'فترة انتظار';

  @override
  String onCooldownBody(String date) {
    return 'يمكنك التبرع مرة أخرى في $date';
  }

  @override
  String get pendingDonationTitle => 'تبرع معلق';

  @override
  String get pendingDonationBody => 'أكمل تبرعك الحالي قبل قبول آخر.';

  @override
  String get noNearbyRequests => 'لا توجد طلبات قريبة';

  @override
  String get noNearbyRequestsHint => 'سيتم إشعارك عند ظهور طلب جديد.';

  @override
  String get requestsTitle => 'الطلبات';

  @override
  String get newRequest => 'طلب دم';

  @override
  String get noRequestsYet =>
      'لا توجد طلبات حتى الآن.\nاضغط على الزر لطلب الدم.';

  @override
  String get sectionActive => 'نشطة';

  @override
  String get sectionPast => 'سابقة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get cancelRequestTitle => 'إلغاء الطلب؟';

  @override
  String get cancelRequestContent => 'سيتم إيقاف البحث عن المتبرعين.';

  @override
  String get keep => 'الاحتفاظ';

  @override
  String get cancelRequestButton => 'إلغاء الطلب';

  @override
  String get statusSearching => 'البحث عن متبرعين';

  @override
  String get statusInProgress => 'تم تأكيد المتبرعين';

  @override
  String get statusFulfilled => 'تم الإنجاز';

  @override
  String get statusCancelled => 'ملغى';

  @override
  String get statusUnfulfilled => 'لم يتم العثور على متبرع';

  @override
  String get createRequestTitle => 'طلب دم';

  @override
  String get unitsNeeded => 'الوحدات المطلوبة';

  @override
  String get contactPhone => 'هاتف الاتصال';

  @override
  String get contactPhoneHelper =>
      'سيتصل المتبرعون بهذا الرقم (9 إلى 11 رقمًا)';

  @override
  String get phoneRequiredDigits => 'يجب أن يتكون من 9 إلى 11 رقمًا';

  @override
  String get phoneDigitsOnly => 'أرقام فقط';

  @override
  String get notesOptional => 'ملاحظات (اختياري)';

  @override
  String get notesHint => 'اسم المستشفى، الغرفة، إلخ.';

  @override
  String get createRequestButton => 'إنشاء الطلب';

  @override
  String get locationCaptured => 'تم تحديد الموقع';

  @override
  String get useMyLocation => 'استخدام موقعي';

  @override
  String get productWholeBlood => 'دم كامل';

  @override
  String get productPlatelets => 'صفائح دموية';

  @override
  String get requestDetailTitle => 'الطلب';

  @override
  String get donors => 'المتبرعون';

  @override
  String get locationLabel => 'الموقع';

  @override
  String get acceptRequest => 'قبول الطلب';

  @override
  String get yourOwnRequest => 'هذا طلبك الخاص';

  @override
  String get acceptFailed => 'فشل القبول';

  @override
  String get acceptSuccessTitle => 'أنت ملتزم';

  @override
  String get acceptSuccessLead => 'شكراً لقبولك. إليك الخطوات التالية:';

  @override
  String get acceptStep1 => 'اتصل بالطالب لتحديد وقت ومكان اللقاء.';

  @override
  String get acceptStep2 => 'اذهب إلى نقطة اللقاء وتبرع.';

  @override
  String get acceptStep3 =>
      'اضغط على \"لقد تبرعت\" في علامة تبويب التبرعات عند الانتهاء.';

  @override
  String get gotIt => 'حسناً';

  @override
  String get next => 'التالي';

  @override
  String get donationsTitle => 'التبرعات';

  @override
  String get noAcceptancesYet => 'لم تقبل أي طلبات حتى الآن.';

  @override
  String get sectionPending => 'تبرع معلق';

  @override
  String get sectionDonated => 'تم التبرع';

  @override
  String acceptedOn(String date) {
    return 'تم القبول • $date';
  }

  @override
  String donatedOn(String date) {
    return 'تم التبرع • $date';
  }

  @override
  String get call => 'اتصال';

  @override
  String get iDonated => 'لقد تبرعت';

  @override
  String get confirmDonationTitle => 'تأكيد التبرع';

  @override
  String get confirmDonationContent =>
      'تأكيد تبرعك بالدم لهذا الطلب؟ سيبدأ هذا فترة الانتظار.';

  @override
  String get confirm => 'تأكيد';

  @override
  String get donationFailed => 'فشل تسجيل التبرع';

  @override
  String get profileTitle => 'الملف الشخصي';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get logoutConfirmTitle => 'تسجيل الخروج؟';

  @override
  String get logoutConfirmContent => 'ستحتاج إلى تسجيل الدخول مرة أخرى.';

  @override
  String get deleteAccountConfirmTitle => 'حذف الحساب؟';

  @override
  String get deleteAccountConfirmContent =>
      'سيؤدي هذا إلى حذف حسابك وجميع بياناتك نهائياً. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get delete => 'حذف';

  @override
  String availableAgainOn(String date) {
    return 'متاح مرة أخرى في $date';
  }

  @override
  String get availableToDonate => 'متاح للتبرع';

  @override
  String get mayReceiveRequests => 'قد تتلقى طلبات للدم';

  @override
  String get wontBeNotified => 'لن يتم إشعارك';

  @override
  String get notificationsRequiredForDonor =>
      'قم بتمكين الإشعارات في إعدادات جهازك لتلقي طلبات الدم.';

  @override
  String get editProfileTitle => 'تعديل الملف الشخصي';

  @override
  String get save => 'حفظ';

  @override
  String get profileUpdated => 'تم تحديث الملف الشخصي';

  @override
  String get tabHome => 'الرئيسية';

  @override
  String get tabRequests => 'الطلبات';

  @override
  String get tabDonations => 'التبرعات';

  @override
  String get tabProfile => 'الملف الشخصي';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get forgotPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get forgotPasswordHint =>
      'أدخل بريدك الإلكتروني. سنرسل لك رمزاً لإعادة تعيين كلمة المرور.';

  @override
  String get sendCode => 'إرسال الرمز';

  @override
  String get resetCodeTitle => 'أدخل رمز الإعادة';

  @override
  String get resetCodeHint =>
      'تحقق من بريدك الإلكتروني للحصول على رمز مكون من 6 أرقام.';

  @override
  String get code => 'الرمز';

  @override
  String get newPassword => 'كلمة مرور جديدة';

  @override
  String get resetPassword => 'إعادة تعيين كلمة المرور';

  @override
  String get passwordReset =>
      'تم إعادة تعيين كلمة المرور. يمكنك تسجيل الدخول الآن.';

  @override
  String get invalidCode => 'رمز غير صالح أو منتهي الصلاحية';

  @override
  String get codeSent => 'إذا كان البريد الإلكتروني مسجلاً، فقد تم إرسال رمز.';

  @override
  String get language => 'اللغة';

  @override
  String get systemDefault => 'افتراضي النظام';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get changePasswordTitle => 'تغيير كلمة المرور';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get confirmNewPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get passwordsDontMatch => 'كلمات المرور غير متطابقة';

  @override
  String get passwordChanged => 'تم تغيير كلمة المرور';

  @override
  String get selfCheckTitle => 'فحص ذاتي سريع';

  @override
  String get selfCheckLead => 'قبل الالتزام، تأكد أنه يمكنك التبرع اليوم:';

  @override
  String get selfCheckHealthy => 'أشعر أنني بصحة جيدة اليوم';

  @override
  String get selfCheckAge => 'عمري 18 سنة أو أكثر';

  @override
  String get selfCheckWeight => 'وزني 50 كغ على الأقل';

  @override
  String get selfCheckSleep => 'نمت جيدًا الليلة الماضية';

  @override
  String get selfCheckCooldownOk => 'انقضت فترة الانتظار منذ آخر تبرع لك';

  @override
  String get selfCheckCooldownUnknown =>
      'إذا سبق لك التبرع، أخبر الطاقم بتاريخ آخر تبرع';

  @override
  String get selfCheckBlockedTitle => 'لست مؤهلاً بعد';

  @override
  String selfCheckBlockedBody(String date) {
    return 'يمكنك التبرع مجددًا في $date';
  }

  @override
  String get selfCheckConfirm => 'أنا مستعد — قبول';

  @override
  String get prepGuideTitle => 'قبل الذهاب';

  @override
  String get prepGuideEat => 'تناول وجبة كاملة';

  @override
  String get prepGuideWater => 'اشرب كمية كافية من الماء';

  @override
  String get prepGuideSleeves => 'ارتدِ أكمامًا قصيرة';

  @override
  String get prepGuideId => 'أحضر بطاقة هويتك';

  @override
  String get prepGuideCall => 'اتصل بصاحب الطلب للاتفاق على مكان وموعد اللقاء';

  @override
  String get prepGuideDisclose =>
      'أخبر الطاقم إذا كنت مريضًا خلال الـ 15 يومًا الماضية أو تتناول أي دواء';

  @override
  String get duringGuideTitle => 'في مركز التبرع';

  @override
  String get duringGuideRelax => 'ابقَ مسترخيًا';

  @override
  String get duringGuideArm => 'أبقِ ذراعك ثابتة';

  @override
  String get duringGuideSpeakUp => 'أخبر الممرض إذا شعرت بأي شيء غير طبيعي';

  @override
  String get duringGuideRecord =>
      'اضغط على \"تبرعت\" في تبويب التبرعات عند الانتهاء';

  @override
  String get aftercareTitle => 'أنت بطل! ❤️';

  @override
  String get aftercareLead => 'اعتنِ بنفسك بقية اليوم:';

  @override
  String get aftercareWater => 'اشرب مزيدًا من الماء';

  @override
  String get aftercareSnack => 'تناول وجبة خفيفة';

  @override
  String get aftercareNoLifting => 'لا ترفع أشياء ثقيلة اليوم';

  @override
  String get aftercareNoExercise => 'تجنب التمارين الشاقة اليوم';

  @override
  String aftercareEligibleAgain(String date) {
    return 'ستكون مؤهلاً للتبرع مجددًا في $date';
  }
}
