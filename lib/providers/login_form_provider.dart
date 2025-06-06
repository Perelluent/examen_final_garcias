import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = 'pere';
  String password = '1234567';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('Valor del formulari: ${formKey.currentState?.validate()}');
    print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }
}