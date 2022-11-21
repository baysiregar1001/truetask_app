class Validator {
  String? validateField({required String field}) {
    if (field.isEmpty) {
      return 'Field tidak boleh kosong';
    }

    return null;
  }

  String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return 'Email tidak boleh kosong';
    }

    return null;
  }

  String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (password.length < 6) {
      return 'Password minimal 6 karakter';
    }

    return null;
  }
}
