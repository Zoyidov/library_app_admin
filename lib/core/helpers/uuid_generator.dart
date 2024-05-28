import 'dart:math';

class UniqueIdHelper {
  static const String _letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String _digits = '0123456789';
  static final Random _random = Random();
  static final RegExp _uidRegExp = RegExp(r'^[A-Z]{3}\d{6}$');
  static const String _emailDomain = 'example.com'; // Customize the domain as needed

  // Generate a unique ID in the format XXX######
  static String generateUniqueId() {
    String letterPart = _generateRandomString(_letters, 3);
    String numberPart = _generateRandomString(_digits, 6);
    return '$letterPart$numberPart';
  }

  // Helper function to generate a random string of given length from the source characters
  static String _generateRandomString(String source, int length) {
    return List.generate(length, (index) => source[_random.nextInt(source.length)]).join();
  }

  // Check if the given string matches the custom UID format XXX######
  static bool isValidUniqueId(String id) {
    return _uidRegExp.hasMatch(id);
  }

  // Generate an email address using the given unique ID
  static String generateEmailFromId(String id) {
    if (isValidUniqueId(id)) {
      return '$id@$_emailDomain';
    } else {
      throw ArgumentError('Invalid unique ID format');
    }
  }
}