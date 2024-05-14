
class TValidator {

  /// empty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required. ';
    }
    return null;
  }
  static String? validateEmail(String? value) {
    if( value == null || value.isEmpty) {
      return 'Email is required';
    }

    // regex for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if( value == null || value.isEmpty) {
      return 'Password is required';
    }

    //check for minimum password length
    if(value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    //check for uppercase letter
    if(!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    
    //check for numbers
    if(!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    //check for special characters
    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must have at least one special character';
    }

    return null;

  }

  static String? validatePhoneNumber(String? value) {
    if( value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    //regex for phone number validation (assuming 10-digit us number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'invalid phone number 10 digits required.';
    }

    return null;
  }

  // add more custom validations as required for your specific requirements
}