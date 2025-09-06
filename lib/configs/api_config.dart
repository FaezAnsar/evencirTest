import 'dart:io';

class ApiConfig {
  // Google Maps API key from AndroidManifest.xml
  static String get googleMapsApiKey =>
      Platform.isAndroid
          ? 'AIzaSyD3WqxLV32Y-bKgLVUhI_d4KF1cK7hVjZs'
          : 'AIzaSyCEbX1e2ByMeM05_t2PgVy-yAGaVJhnpE4';

  // Timeout duration for API calls (in seconds)
  static const int timeoutDuration = 30;

  static const String stripePublishableKey =
      'pk_test_51RdbvSDAVVZ1XlJvsE6gwjiS24NASXh98aPTKVldrgcj6dJIG94tLegM3v5e3yoHICxSuUGp1rGt6b7zENZ9wPje00rpODDtQu';

  static const String baseUrl = 'https://eazipark.dev.tekki.dev';

  static const String termsAndCondition = '$baseUrl/content/terms-and-condition';
  static const String privacyPolicy = '$baseUrl/content/privacy-policy';
}
