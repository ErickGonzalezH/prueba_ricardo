import 'package:flutter/material.dart';

class ValidateFormulario extends ChangeNotifier {
  GlobalKey<FormState> keyFormulario = GlobalKey<FormState>();

  String nombre = '';
  String clave = '';
  String correo = '';
  String telefono = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return keyFormulario.currentState?.validate() ?? false;
  }
}