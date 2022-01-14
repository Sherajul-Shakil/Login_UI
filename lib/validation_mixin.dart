class ValidationMixin {
  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Email';
    } else if (!value.contains('@')) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 character';
    }
    return null;
  }
}
