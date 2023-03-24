import 'package:flutter/material.dart';

import 'dog_model.dart';

class ListDogsPage extends StatefulWidget {
  const ListDogsPage({super.key});

  @override
  State<ListDogsPage> createState() => _ListDogsPageState();
}

class _ListDogsPageState extends State<ListDogsPage> {

  List<Dog> dogs = [];

  @override
  void initState() {
    loadDogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dogs List'),
        ),
        body: ListView.separated(
          itemCount: dogs.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(dogs[index].name),
              subtitle: Text("${dogs[index].age}"),
            );
          },
        ));
  }
  void loadDogs() async{
    final dogList = await Dog.getDog();
    setState(() {
      dogs = dogList;      
    });
  }

}
