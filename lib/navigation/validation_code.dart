import 'package:flutter/material.dart';

class ValidationCode extends StatefulWidget {
  const ValidationCode({super.key});

  @override
  State<ValidationCode> createState() => _ValidationCodeState();
}

class _ValidationCodeState extends State<ValidationCode> {
  final TextEditingController _code =  TextEditingController(); 

   void _validateCode() {
    String code = _code.text.trim();

    if (code.isEmpty) {
      _showErrorDialog('Por favor, ingrese el código de verificación.');
    } else if (code.length != 4 || !RegExp(r'^\d{4}$').hasMatch(code)) {
      _showErrorDialog('El código debe tener exactamente 4 dígitos numéricos.');
    } else {
      Navigator.pushNamed(context, '/change');
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
             Image.asset('assets/validation.png',width: 200, height: 200),
             const SizedBox(height: 16),
             TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el código de verifiación',
                labelText: 'Ingrese el código de verifiación',
                border: OutlineInputBorder(),                
              ),
              keyboardType: TextInputType.number,
              controller: _code,
             ),
            const SizedBox(height: 16),
            SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                   _validateCode();
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text(
                    'Validar código',
                  ),
                ),
              ),        
          ],
        )),
      ),
    );
  }
}
