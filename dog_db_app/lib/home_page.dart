import 'package:dog_db_app/list_dogs_page.dart';
import 'package:flutter/material.dart';

import 'dog_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs App'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Registro',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 68, 67, 67)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _ctrlName,
                      decoration: const InputDecoration(label: Text('Nombre')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa un nombre';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _ctrlAge,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(label: Text('Edad')),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa una edad';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40,),
                    ElevatedButton(
                      onPressed: () {                        
                        if (_formKey.currentState!.validate()) {  
                          submit();                        
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registro exitoso')),
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ListDogsPage()));
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void submit() async{
    final name = _ctrlName.text;
    final age = _ctrlAge.text;
    Dog dog = Dog(name: name, age: int.parse(age));
    await Dog.insertDog(dog);
  }
}
