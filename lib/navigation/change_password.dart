import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  var _isObscureNewPassword = true;
  var _isObscureConfirmPassword = true;

  void _validatePasswords() {
    String newPassword = _newPassword.text.trim();
    String confirmPassword = _confirmPassword.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog('Por favor, complete ambos campos de contraseña.');
    } else if (newPassword != confirmPassword) {
      _showErrorDialog('Las contraseñas no coinciden. Por favor, ingrese  la misma contraseña en ambos campos.');
    } else {
      Navigator.pushNamed(context, '/home');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/change_password.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Ingrese su nueva contraseña',
                    label: const Text('Ingrese su nueva contraseña'),
                    border: const OutlineInputBorder(),
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscureNewPassword = !_isObscureNewPassword;
                          });
                        },
                        icon: Icon(_isObscureNewPassword
                            ? Icons.visibility
                            : Icons.visibility_off))),
                controller: _newPassword,
                obscureText: _isObscureNewPassword,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Confirme su nueva contraseña',
                    label: const Text('Confirme su nueva contraseña'),
                    border: const OutlineInputBorder(),
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscureConfirmPassword =
                                !_isObscureConfirmPassword;
                          });
                        },
                        icon: Icon(_isObscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off))),
                controller: _confirmPassword,
                obscureText: _isObscureConfirmPassword,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    _validatePasswords();
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text(
                    'Cambiar contraseña',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
