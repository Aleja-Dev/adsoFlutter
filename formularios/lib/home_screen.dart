import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCrontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formularios')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameCrontroller,
              /* keyboardType: TextInputType.number, */
              /* initialValue: 'Pepe',  */
              decoration: const InputDecoration(
                  label: Text('Nombre'),
                  icon: Icon(Icons.person),
                  iconColor: Colors.grey),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Debes ingresar un nombre';
                }
                if (value.length < 3) {
                  return 'Debes ingresar un nombre mayor a 3 caracteres';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
