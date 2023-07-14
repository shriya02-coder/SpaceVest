import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // registerAccount
  {
    'lser300j': {
      'en': 'Get Started',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'o4tque7g': {
      'en': 'Create your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    's03mypj1': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'yve6c5ru': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'iohezue9': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'n2fp3bph': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'allx0kk6': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'v1nuz48v': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'o5miorqd': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    '2bl3kqzw': {
      'en': 'Login',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    'jy4gki5m': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '0kk5liqn': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    '72ii0waq': {
      'en': 'Preferred Industry',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'pf8glhkg': {
      'en': 'What industry interests you?',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // onboarding
  {
    '7u8lion2': {
      'en': 'SpaceVest',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i8hl2uua': {
      'en': 'Manage Investments',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en':
          'Manage investments with the help of company portfolios and ESG scores',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'mjy3ljln': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    'uf9k1spp': {
      'en': 'Easily buy and sell stocks by throughly reviewing the companies.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    '9c4outzf': {
      'en': 'Personal Portfolio',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'q30ina4f': {
      'en':
          'Build a green personal portfolio by investing in sustainable companies.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'ypt7b97g': {
      'en': 'Step Towards Sustainability',
      'ar': 'إنشاء ميزانيتك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_Card
  {
    '4mcyt9tx': {
      'en': '           My Wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9b0j67se': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'axrvkhrv': {
      'en': '+\$12,402',
      'ar': '+ 12402 دولار',
      'de': '+12.402 \$',
      'es': '+\$12,402',
    },
    '0d7w9e0i': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'pz18je88': {
      'en': 'Spending',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '7zehf4ik': {
      'en': '+\$12,402',
      'ar': '+ 12402 دولار',
      'de': '+12.402 \$',
      'es': '+\$12,402',
    },
    'vt8zmv8t': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'yet7zk5d': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '8bnd6lco': {
      'en': 'Chatbot',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'roobc02h': {
      'en': 'Personalised Recommendation',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '27pb7ji4': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'm8rhanhc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // paymentDetails
  {
    'j0yzgf4n': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'de': 'Einzelheiten',
      'es': 'Detalles',
    },
    'zv72ekdw': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '0rjyjwed': {
      'en': 'Vendor',
      'ar': 'بائع',
      'de': 'Verkäufer',
      'es': 'Vendedor',
    },
    'eeyn6dk2': {
      'en': 'When',
      'ar': 'متى',
      'de': 'Wann',
      'es': 'Cuándo',
    },
    'w8ud9b3f': {
      'en': 'Jul 26, 10:00am',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lxc916mk': {
      'en': 'Jul 26, 10:00am',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
    },
    '9aogde79': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'eojlfs66': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // transactionComplete
  {
    'xf8d4sm8': {
      'en': 'Transaction Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en': 'Great work, you successfully completed the trasaction. ',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // buy_page
  {
    'qywon4k1': {
      'en': 'Buy',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '4zo8g4mb': {
      'en': 'Stock Name ',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'swxms7ln': {
      'en': 'Enter number of stocks',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    '8bemaobd': {
      'en': 'Buy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    'zoxan2gi': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
    },
    '8h1cjk5a': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'r72zvrv5': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
      'de':
          'Wählen Sie unten aus, welche Benachrichtigungen Sie erhalten möchten, und wir aktualisieren die Einstellungen.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
    },
    'gjygkr0n': {
      'en': 'Push Notifications',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'es': 'Notificaciones push',
    },
    '3y3yhxbk': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'تلقي إشعارات من تطبيقنا على أساس شبه منتظم.',
      'de':
          'Erhalten Sie regelmäßig Push-Benachrichtigungen von unserer Anwendung.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
    },
    '1ytebj35': {
      'en': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'es': 'Notificaciónes de Correo Electrónico',
    },
    '9lvh5nst': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
    },
    '69d2j74u': {
      'en': 'Location Services',
      'ar': 'خدمات الموقع',
      'de': 'Standortdienste',
      'es': 'Servicios de localización',
    },
    '3k8cuv0d': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar':
          'اسمح لنا بتتبع موقعك ، فهذا يساعد على تتبع الإنفاق ويحافظ على سلامتك.',
      'de':
          'Erlauben Sie uns, Ihren Standort zu verfolgen, dies hilft, die Ausgaben im Auge zu behalten und schützt Sie.',
      'es':
          'Permítanos rastrear su ubicación, esto ayuda a realizar un seguimiento de los gastos y lo mantiene seguro.',
    },
    'isgrgbfs': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'Wie wir Ihre Daten verwenden',
      'es': 'Cómo usamos sus datos',
    },
    'nbiyrnzl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis bei erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia bei quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem entero vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus en massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Cómodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage
  {
    '51kawpgz': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    '30kx6e5v': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'wknu2tm4': {
      'en': 'Current Spend',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'syy689nt': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'y7zomzzp': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    'rfozud9v': {
      'en': 'Chatbot',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'pcrarg0a': {
      'en': 'Personalised Recommendation',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'zmjsfzgg': {
      'en': 'Educational',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'dfjtbkbo': {
      'en': 'Top Sustainable Companies',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'g7t9krj7': {
      'en': 'Tesla',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'vupu5y5p': {
      'en': 'ESG Score:  79',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // searchPage_stock
  {
    'isg8xeor': {
      'en': 'Search for companies',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gf56aese': {
      'en': 'Ran',
      'ar': '',
      'de': '',
      'es': '',
    },
    'byyb9bdf': {
      'en': 'Companies matching search',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fej5iso0': {
      'en': 'Search Companies',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7oa6duns': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // ChooseOption
  {
    'dbhe6zxe': {
      'en': 'Categories',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1anro5uc': {
      'en': 'Mutual Funds on Earth',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ti9sml30': {
      'en': 'Cryptocurrency on Earth',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h7qcfvl7': {
      'en': 'Asteroid Mining',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jpzt3ipm': {
      'en': 'Top Stocks on Earth',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bsfy4dx2': {
      'en': 'Planetary Real Estate',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xnu1yljn': {
      'en': 'Stocks on Mars',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd4ks3qu4': {
      'en': 'Visualise sustainability',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qptuc5su': {
      'en': 'Choose Options',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nx3hhhkk': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // searchPage_cryto
  {
    'bzntfr43': {
      'en': 'Search for patients...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4ql8a3dh': {
      'en': 'Ran',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9ynsepj0': {
      'en': 'Companies matching search',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0defjq3g': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tzv0i05d': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z8xxrcen': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mxtrhykl': {
      'en': 'Search Companies',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xcf494af': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // searchPage_mutual
  {
    'c36ve2x0': {
      'en': 'Search for patients...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lbfq0ve7': {
      'en': 'Ran',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lcdt9c6q': {
      'en': 'Companies matching search',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fdz2ps30': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y6jzackw': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gk9fmdar': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z5pomz4d': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f5lwufsb': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k7k6q4sn': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k6cxkaqs': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rn36fj3u': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'usg9gyk2': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4tp4y9jp': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wdgv304x': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mb2g8okh': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mi3uvvj0': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '538frvbm': {
      'en': 'Raku Davis',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g76c6cui': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7o095azv': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qg0oly2g': {
      'en': 'Search Companies',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c0ta6eny': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // searchPage_green
  {
    'nj9h2ikx': {
      'en': 'Search for patients...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '68r3j6n6': {
      'en': 'Ran',
      'ar': '',
      'de': '',
      'es': '',
    },
    's126lwp0': {
      'en': 'Companies matching search',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4mxcpuz': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e3pcm4qr': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lz2u6hri': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'det6oios': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5edn46fp': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'euo6pnkk': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zmkayv8d': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'acoi7lyt': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jiuqnz0k': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7jzwgxoy': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ebh6u7bs': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c4l7ku9m': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '49l1594y': {
      'en': 'Company',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lveif0yd': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6butl4t8': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '16bey97v': {
      'en': 'Raku Davis',
      'ar': '',
      'de': '',
      'es': '',
    },
    'seeiyrqc': {
      'en': '(123) 456-7890',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lwmwbgwp': {
      'en': 'name@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2wxh61xd': {
      'en': 'Search Companies',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uuq3pgmt': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // CompanyInfo
  {
    'o8jkoqa8': {
      'en': '  ESG Score:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'evve6bqy': {
      'en': 'Sustainability Initiatives',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7at8giio': {
      'en': 'Buy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e7wse8ek': {
      'en': 'Sell',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7yhu60hi': {
      'en': 'Environmental Pillar Score',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'ibq7bv2r': {
      'en': '       Social Pillar Score',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    'z61l44py': {
      'en': 'Governance Pillar\n Score',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'v1ls0gce': {
      'en': 'Overall Industry Rank',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
  },
  // PersonalPortfolio
  {
    'gwxhrlsv': {
      'en': 'Welcome',
      'ar': '',
      'de': '',
      'es': '',
    },
    '81l08w6n': {
      'en': 'Your recent activity is below.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rj4pixs6': {
      'en': 'Green Goals Met',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7gpfoh3c': {
      'en': 'Financial Analysis',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zrkf8ahu': {
      'en': 'Alerts',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8io25c80': {
      'en': 'Average ESG: 59',
      'ar': '',
      'de': '',
      'es': '',
    },
    '07sat2nh': {
      'en': 'Alert',
      'ar': '',
      'de': '',
      'es': '',
    },
    'inno8mhl': {
      'en':
          'Invest in a companies with ESG risk rating more than 22 to increase your average ESG',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ohijy071': {
      'en': 'Alert',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tsdetv5t': {
      'en':
          'Congratulations on your green investments! Your average ESG score has been updated.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y79xtugu': {
      'en': 'View your wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    '789zm6zg': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // educationPage
  {
    'cfmh6h73': {
      'en': 'Video Lessons',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xd87u5ih': {
      'en': 'Video Lesson Tutorials',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n422p35m': {
      'en': 'Play Lesson 1',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k6r3c2xs': {
      'en': 'Watch Trailer',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6got36y7': {
      'en': 'My List',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sr0nz772': {
      'en': 'Lessons',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2iecqdgj': {
      'en': '05:03',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0s5kbrgk': {
      'en': '1. Invest in Planetary Real Estate',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fnl4mp1y': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus et turpis ultricies, ac cursus erat tincidunt. Praesent sit amet dignissim erat.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nu780qnm': {
      'en': 'Download',
      'ar': '',
      'de': '',
      'es': '',
    },
    'beaxnnez': {
      'en': '05:03',
      'ar': '',
      'de': '',
      'es': '',
    },
    '10w4cwp5': {
      'en': '2. Invest in Earth Cryptocurrency',
      'ar': '',
      'de': '',
      'es': '',
    },
    '97k722yf': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus et turpis ultricies, ac cursus erat tincidunt. Praesent sit amet dignissim erat.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l1v63wn9': {
      'en': 'Download',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ktjltz83': {
      'en': 'Overview',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4iaeia2v': {
      'en': 'What you will learn',
      'ar': '',
      'de': '',
      'es': '',
    },
    'axai5roo': {
      'en': 'Learning how to invest in Real Estate',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ud5c30rd': {
      'en': 'Buying various lands',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vgdwevm7': {
      'en': 'What you will learn',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ic7kkr4p': {
      'en': '16 Lessons',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7pvi4yj9': {
      'en': 'Exclusive Learning Material',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wiaiaj4z': {
      'en': 'Ordered Learning',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wjp0l9ld': {
      'en': 'Frequently Asked Questions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f0rrbldh': {
      'en': 'Related Content',
      'ar': '',
      'de': '',
      'es': '',
    },
    'llx5c0z1': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n2pqlbzm': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus et...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b7ov2lel': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // educationGrid
  {
    'ahmxqqxj': {
      'en': 'Let\'s Learn',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jwom61hb': {
      'en': 'Your lessons',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ea1vr1w4': {
      'en': 'Today\'s Target',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ccctxdaa': {
      'en': '3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i1qevlzh': {
      'en': 'Avg. Daily Reads',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yuv2hdg8': {
      'en': '2',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0iowl0tt': {
      'en': 'Beginner Reads',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q0ldcne9': {
      'en': 'How to choose best stock',
      'ar': '',
      'de': '',
      'es': '',
    },
    '95epxwda': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus ...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n3jzt1dt': {
      'en': '2m',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o6mib9lo': {
      'en': 'What is ESG?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ehl4253n': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus ...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xrfegbei': {
      'en': '2m',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vww1r2te': {
      'en': 'Video Lessons',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2g4qrlb7': {
      'en': 'Invest in sustainability',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ldb86ts6': {
      'en': 'Time',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2qjgrsrz': {
      'en': 'Difficulty',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mcxnnbcf': {
      'en': '20 mins',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4h9xxusq': {
      'en': 'Medium',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm74nsk1q': {
      'en': 'Educational',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ewfb87gs': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // sell_page
  {
    'l7u6j3sr': {
      'en': 'Sell',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'gh11868l': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'bev7lxko': {
      'en': 'Stock Name ',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'efxbo3wz': {
      'en': 'Enter number of stocks',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    '3st9s3ao': {
      'en': 'Sell',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ckgl9liz': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'jhdtb117': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // realEstate
  {
    'g3wzblwo': {
      'en': 'Buy Real Estate ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kvansc1': {
      'en': 'Find some wonderful lands to invest in.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jyzd7kik': {
      'en': 'Popular Bookings',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iip0k21w': {
      'en': 'Buy Land On Mars ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5rrdctmf': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus et turpis ultricies, ac cursus erat tincidunt. Praesent sit amet dignissim erat. Morbi dapibus nec lorem quis porta. Suspendisse potenti.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z17ovixl': {
      'en': '9880 SC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g29zm6o3': {
      'en': 'Buy',
      'ar': '',
      'de': '',
      'es': '',
    },
    '04r3sc6h': {
      'en': 'Buy Land On Moon ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jjg2fr85': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus et turpis ultricies, ac cursus erat tincidunt. Praesent sit amet dignissim erat. Morbi dapibus nec lorem quis porta. Suspendisse potenti.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9dm9h2r5': {
      'en': '9180 SC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ksoeg7jt': {
      'en': 'Buy',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2zeq9jfw': {
      'en': 'Buy Land On Venus',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ohr9g73s': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat lacus et turpis ultricies, ac cursus erat tincidunt. Praesent sit amet dignissim erat. Morbi dapibus nec lorem quis porta. Suspendisse potenti.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3t58oyrc': {
      'en': '7789 SC',
      'ar': '',
      'de': '',
      'es': '',
    },
    's9kdgy6n': {
      'en': 'Buy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fpo3x5n5': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // ViewOptions
  {
    '3kjir21g': {
      'en': 'Visualising Options',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dptfawq2': {
      'en': 'These are your daily details.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n54077fn': {
      'en': 'Your Week',
      'ar': '',
      'de': '',
      'es': '',
    },
    'liddx8pa': {
      'en': 'Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0y3bn6jn': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Recommendation
  {
    'ikrbdatb': {
      'en': '  ESG Score:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nrvhu5oj': {
      'en': 'Sustainability Initiatives',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ihmsgiwx': {
      'en': 'Buy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zjfnujj2': {
      'en': 'Sell',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // recommendationPage
  {
    'gnqrmotr': {
      'en': 'Companies recommended',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l2chtesy': {
      'en': 'Personalised Recommendations',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ouaurw18': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // loginPageCopy
  {
    '8za3mf8f': {
      'en': 'Welcome back',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'tmg9289d': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'seur4w8k': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '572h1pvu': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'jhoa3xk3': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    '7zpzwovd': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '7daw5qwc': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'pbxr79xt': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'gsdcdg6e': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'utk3b47z': {
      'en': 'Create',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'nioghfbe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // chatbot
  {
    'o88kmgh3': {
      'en': 'QR CODE',
      'ar': '',
      'de': '',
      'es': '',
    },
    '06y9i84o': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // bookAppointment
  {
    'sfzj3riz': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    '4skzh9os': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'b87tcas2': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'iicnw3dq': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    '5tkkg4yu': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '7w5m45zt': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'bmfmxg71': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'prt95f0g': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    '7ohalsg9': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'xukiv2ku': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'lpc88cht': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'b5umyycx': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookingOld
  {
    '8laf5zmk': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'udwhsu8p': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'm6f5lawq': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'yz52729g': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'hdmqdmzq': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    'stpxpct6': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'wvgk6obb': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'xt7ujyt8': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'andpn0t0': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'ycaso9dc': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    '2pmd2p3w': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    '13j05r8j': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // editBooking
  {
    '6j668hma': {
      'en': 'Edit Appointment',
      'ar': 'تحرير موعد',
      'de': 'Termin bearbeiten',
      'es': 'Editar cita',
    },
    'cbp936ta': {
      'en': 'Edit the fields below in order to change your appointment.',
      'ar': 'قم بتحرير الحقول أدناه لتغيير موعدك.',
      'de': 'Bearbeiten Sie die Felder unten, um Ihren Termin zu ändern.',
      'es': 'Edite los campos a continuación para cambiar su cita.',
    },
    '6btfslje': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'mhko6q8p': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'shqcgjqe': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '5ixhbnsd': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'db46hhfw': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'e1zm6kzh': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'oy6qvd33': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    '9emhgrhs': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija Fecha',
    },
    '2bzoinpy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'gjnq0j86': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Seguro que quieres pausar tu tarjeta?',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا بأس',
      'de': 'egal',
      'es': 'No importa',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
