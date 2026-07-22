// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get locationServicesDisabled =>
      'Activez la localisation pour voir les demandes à proximité';

  @override
  String get locationPermissionDenied =>
      'Hayatuk a besoin de votre position pour trouver les demandes proches';

  @override
  String get locationPermissionDeniedForever =>
      'La localisation est désactivée. Activez-la dans les paramètres de votre téléphone pour utiliser l\'application.';

  @override
  String get locationTimeout =>
      'Impossible d\'obtenir votre position. Vérifiez que la localisation est activée et réessayez.';

  @override
  String get loginTitle => 'Connexion';

  @override
  String get loginButton => 'Se connecter';

  @override
  String get loginDontHaveAccount => 'Pas de compte ? S\'inscrire';

  @override
  String get registerTitle => 'Inscription';

  @override
  String get registerButton => 'Créer un compte';

  @override
  String get registerHasAccount => 'Déjà un compte ? Se connecter';

  @override
  String get name => 'Nom';

  @override
  String get email => 'E-mail';

  @override
  String get emailInvalid => 'E-mail invalide';

  @override
  String get password => 'Mot de passe';

  @override
  String get passwordHelperMinChars => 'Au moins 8 caractères';

  @override
  String get passwordTooShort =>
      'Le mot de passe doit contenir au moins 8 caractères';

  @override
  String get bloodType => 'Groupe sanguin';

  @override
  String get phoneOptional => 'Téléphone (facultatif)';

  @override
  String get required => 'Requis';

  @override
  String get retry => 'Réessayer';

  @override
  String get bloodRequest => 'Demande de sang';

  @override
  String kmAway(String distance) {
    return 'À $distance km';
  }

  @override
  String donorsCount(int accepted, int needed) {
    return '$accepted/$needed donneurs';
  }

  @override
  String get viewDetails => 'Voir les détails';

  @override
  String get view => 'Voir';

  @override
  String get newBloodRequest => 'Nouvelle demande de sang';

  @override
  String get donorModeOff => 'Mode donneur désactivé';

  @override
  String get donorModeOffHint =>
      'Activez le mode donneur dans votre profil pour voir les demandes.';

  @override
  String get onCooldownTitle => 'Période d\'attente';

  @override
  String onCooldownBody(String date) {
    return 'Vous pourrez donner à nouveau le $date';
  }

  @override
  String get pendingDonationTitle => 'Don en attente';

  @override
  String get pendingDonationBody =>
      'Terminez votre don en cours avant d\'en accepter un autre.';

  @override
  String get noNearbyRequests => 'Aucune demande à proximité';

  @override
  String get noNearbyRequestsHint =>
      'Vous serez notifié lorsqu\'une demande apparaîtra.';

  @override
  String get requestsTitle => 'Demandes';

  @override
  String get newRequest => 'Demander du sang';

  @override
  String get noRequestsYet =>
      'Aucune demande pour l\'instant.\nAppuyez sur le bouton pour demander du sang.';

  @override
  String get sectionActive => 'Actives';

  @override
  String get sectionPast => 'Passées';

  @override
  String get cancel => 'Annuler';

  @override
  String get cancelRequestTitle => 'Annuler la demande ?';

  @override
  String get cancelRequestContent => 'Cela arrêtera la recherche de donneurs.';

  @override
  String get keep => 'Conserver';

  @override
  String get cancelRequestButton => 'Annuler la demande';

  @override
  String get statusSearching => 'Recherche de donneurs';

  @override
  String get statusInProgress => 'Donneurs confirmés';

  @override
  String get statusFulfilled => 'Accomplie';

  @override
  String get statusCancelled => 'Annulée';

  @override
  String get statusUnfulfilled => 'Aucun donneur trouvé';

  @override
  String get createRequestTitle => 'Demander du sang';

  @override
  String get unitsNeeded => 'Unités nécessaires';

  @override
  String get contactPhone => 'Téléphone de contact';

  @override
  String get contactPhoneHelper =>
      'Les donneurs appelleront ce numéro (9 à 11 chiffres)';

  @override
  String get phoneRequiredDigits => 'Doit comporter 9 à 11 chiffres';

  @override
  String get phoneDigitsOnly => 'Chiffres uniquement';

  @override
  String get notesOptional => 'Notes (facultatif)';

  @override
  String get notesHint => 'Nom de l\'hôpital, salle, etc.';

  @override
  String get createRequestButton => 'Créer la demande';

  @override
  String get locationCaptured => 'Position enregistrée';

  @override
  String get useMyLocation => 'Utiliser ma position';

  @override
  String get productWholeBlood => 'Sang complet';

  @override
  String get productPlatelets => 'Plaquettes';

  @override
  String get requestDetailTitle => 'Demande';

  @override
  String get donors => 'Donneurs';

  @override
  String get locationLabel => 'Position';

  @override
  String get acceptRequest => 'Accepter la demande';

  @override
  String get yourOwnRequest => 'Ceci est votre propre demande';

  @override
  String get acceptFailed => 'Échec de l\'acceptation';

  @override
  String get acceptSuccessTitle => 'Vous êtes engagé(e)';

  @override
  String get acceptSuccessLead =>
      'Merci d\'avoir accepté. Voici les étapes suivantes :';

  @override
  String get acceptStep1 =>
      'Appelez le demandeur pour fixer l\'heure et le lieu du rendez-vous.';

  @override
  String get acceptStep2 => 'Rendez-vous au point de rencontre et donnez.';

  @override
  String get acceptStep3 =>
      'Appuyez sur « J\'ai donné » dans l\'onglet Dons une fois terminé.';

  @override
  String get gotIt => 'Compris';

  @override
  String get next => 'Suivant';

  @override
  String get donationsTitle => 'Dons';

  @override
  String get noAcceptancesYet =>
      'Vous n\'avez accepté aucune demande pour le moment.';

  @override
  String get sectionPending => 'Don en attente';

  @override
  String get sectionDonated => 'Donné';

  @override
  String acceptedOn(String date) {
    return 'Accepté • $date';
  }

  @override
  String donatedOn(String date) {
    return 'Donné • $date';
  }

  @override
  String get call => 'Appeler';

  @override
  String get iDonated => 'J\'ai donné';

  @override
  String get confirmDonationTitle => 'Confirmer le don';

  @override
  String get confirmDonationContent =>
      'Confirmer que vous avez donné du sang pour cette demande ? Cela démarrera votre période d\'attente.';

  @override
  String get confirm => 'Confirmer';

  @override
  String get donationFailed => 'Échec de l\'enregistrement du don';

  @override
  String get profileTitle => 'Profil';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get logout => 'Déconnexion';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String get logoutConfirmTitle => 'Se déconnecter ?';

  @override
  String get logoutConfirmContent => 'Vous devrez vous reconnecter.';

  @override
  String get deleteAccountConfirmTitle => 'Supprimer le compte ?';

  @override
  String get deleteAccountConfirmContent =>
      'Cela supprimera définitivement votre compte et toutes vos données. Cette action est irréversible.';

  @override
  String get delete => 'Supprimer';

  @override
  String availableAgainOn(String date) {
    return 'Disponible à nouveau le $date';
  }

  @override
  String get availableToDonate => 'Disponible pour donner';

  @override
  String get mayReceiveRequests => 'Vous pouvez recevoir des demandes de sang';

  @override
  String get wontBeNotified => 'Vous ne serez pas notifié';

  @override
  String get editProfileTitle => 'Modifier le profil';

  @override
  String get save => 'Enregistrer';

  @override
  String get profileUpdated => 'Profil mis à jour';

  @override
  String get tabHome => 'Accueil';

  @override
  String get tabRequests => 'Demandes';

  @override
  String get tabDonations => 'Dons';

  @override
  String get tabProfile => 'Profil';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get forgotPasswordTitle => 'Réinitialiser le mot de passe';

  @override
  String get forgotPasswordHint =>
      'Saisissez votre e-mail. Nous vous enverrons un code pour réinitialiser votre mot de passe.';

  @override
  String get sendCode => 'Envoyer le code';

  @override
  String get resetCodeTitle => 'Saisir le code de réinitialisation';

  @override
  String get resetCodeHint =>
      'Consultez votre e-mail pour le code à 6 chiffres.';

  @override
  String get code => 'Code';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get resetPassword => 'Réinitialiser le mot de passe';

  @override
  String get passwordReset =>
      'Mot de passe réinitialisé. Vous pouvez vous connecter.';

  @override
  String get invalidCode => 'Code invalide ou expiré';

  @override
  String get codeSent => 'Si l\'e-mail est enregistré, un code a été envoyé.';

  @override
  String get language => 'Langue';

  @override
  String get systemDefault => 'Par défaut du système';

  @override
  String get changePassword => 'Modifier le mot de passe';

  @override
  String get changePasswordTitle => 'Modifier le mot de passe';

  @override
  String get currentPassword => 'Mot de passe actuel';

  @override
  String get confirmNewPassword => 'Confirmer le nouveau mot de passe';

  @override
  String get passwordsDontMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get passwordChanged => 'Mot de passe modifié';

  @override
  String get selfCheckTitle => 'Auto-évaluation rapide';

  @override
  String get selfCheckLead =>
      'Avant de vous engager, confirmez que vous pouvez donner aujourd\'hui :';

  @override
  String get selfCheckHealthy => 'Je me sens en bonne santé aujourd\'hui';

  @override
  String get selfCheckAge => 'J\'ai 18 ans ou plus';

  @override
  String get selfCheckWeight => 'Je pèse au moins 50 kg';

  @override
  String get selfCheckSleep => 'J\'ai bien dormi cette nuit';

  @override
  String get selfCheckCooldownOk => 'Votre délai entre deux dons est écoulé';

  @override
  String get selfCheckCooldownUnknown =>
      'Si vous avez déjà donné, indiquez au personnel la date de votre dernier don';

  @override
  String get selfCheckBlockedTitle => 'Vous n\'êtes pas encore éligible';

  @override
  String selfCheckBlockedBody(String date) {
    return 'Vous pourrez donner à nouveau le $date';
  }

  @override
  String get selfCheckConfirm => 'Je suis prêt — accepter';

  @override
  String get prepGuideTitle => 'Avant de partir';

  @override
  String get prepGuideEat => 'Prenez un repas complet';

  @override
  String get prepGuideWater => 'Buvez beaucoup d\'eau';

  @override
  String get prepGuideSleeves => 'Portez des manches courtes';

  @override
  String get prepGuideId => 'Apportez votre pièce d\'identité';

  @override
  String get prepGuideCall =>
      'Appelez le demandeur pour convenir du lieu et de l\'heure';

  @override
  String get prepGuideDisclose =>
      'Signalez au personnel si vous avez été malade ces 15 derniers jours ou si vous prenez des médicaments';

  @override
  String get duringGuideTitle => 'Au centre de don';

  @override
  String get duringGuideRelax => 'Restez détendu';

  @override
  String get duringGuideArm => 'Gardez votre bras immobile';

  @override
  String get duringGuideSpeakUp =>
      'Prévenez l\'infirmier si quelque chose ne va pas';

  @override
  String get duringGuideRecord =>
      'Appuyez sur « J\'ai donné » dans l\'onglet Dons une fois terminé';

  @override
  String get aftercareTitle => 'Vous êtes un héros ! ❤️';

  @override
  String get aftercareLead =>
      'Prenez soin de vous pour le reste de la journée :';

  @override
  String get aftercareWater => 'Buvez plus d\'eau';

  @override
  String get aftercareSnack => 'Prenez une collation';

  @override
  String get aftercareNoLifting => 'Pas de charges lourdes aujourd\'hui';

  @override
  String get aftercareNoExercise => 'Évitez le sport intense aujourd\'hui';

  @override
  String aftercareEligibleAgain(String date) {
    return 'Vous pourrez donner à nouveau le $date';
  }
}
