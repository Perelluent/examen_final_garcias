/*
import 'package:examen_final_garcias/providers/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _correu;
  String? _passwd;
  bool _showPassword = false;
  bool _isChecked = false;


  final RegExp emailRegExp = RegExp(r'^\w+[\w\.-]*@\w+\.\w{2,3}$');
  final RegExp contRegExp = RegExp(r'^.{6,}$'); // mínim 6 caràcters

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                .isLogin ? 'Inicia sessió' : 'Registra\'t',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Correu',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.isEmpty) return 'Camp obligatori';
                        if (!emailRegExp.hasMatch(text)) return 'Format incorrecte';
                        return null;
                      },
                      onSaved: (text) => _correu = text,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: 'Contrasenya',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _showPassword ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) return 'Camp obligatori';
                        if (!contRegExp.hasMatch(text)) return 'Mínim 6 caràcters';
                        return null;
                      },
                      onSaved: (text) => _passwd = text,
                    ),
                    if (loginProvider.isLogin)
                      CheckboxListTile(
                        title: Text('Recorda\'m'),
                        value: _isChecked,
                        onChanged: (val) => setState(() => _isChecked = val ?? false),
                      ),
                    SizedBox(height: 10),
                    IconButton(
                      icon: Icon(Icons.arrow_forward, size: 32),
                      onPressed: _submitForm,
                    ),
                    if (loginProvider.isLoading)
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: CircularProgressIndicator(),
                      )
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
               width: 300,
               child: ToggleButtons(
                 isSelected: loginProvider.selectedEvent,
                 onPressed: (i) => loginProvider.opcioMenu(i),
                 borderRadius: BorderRadius.circular(8),
                 selectedColor: Colors.white,
                 fillColor: Colors.blueAccent,
                 color: Colors.black87,
                 constraints: BoxConstraints(minHeight: 40, minWidth: 140),
                 children: const [
                   Text('Inicia sessió'),
                   Text('Registra\'t'),
                 ],
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      await loginProvider.loginOrRegister(_correu ?? '', _passwd ?? '');

      if (loginProvider.accesGranted) {
        Navigator.of(context).pushReplacementNamed('home', arguments: _correu);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(loginProvider.errorMessage)),
        );
      }
    }
  }
}*/