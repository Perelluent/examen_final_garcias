import 'package:examen_final_garcias/models/plats.dart';
import 'package:flutter/material.dart';

class PlatsFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Plats tempProduct;

  PlatsFormProvider(this.tempProduct);

  bool isValidForm() {
    print(tempProduct.nom);
    return formKey.currentState?.validate() ?? false;
  }
  
}