import 'package:flutter/material.dart';
import 'package:flutter_api_practice/models/pets.dart';
import 'package:flutter_api_practice/provider/pets_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final provider = Provider.of<PetsProvider>(context, listen: false);
    provider.getDataFromApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Call App"),
      ),
      body: provider.isLoading
          ? getLoadingUi()
          : provider.error.isNotEmpty
              ? getErrorUi(provider.error)
              : getBody(provider.pets),
    );
  }

  Widget getLoadingUi() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitWave(
            color: Colors.blue[300],
            size: 50.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: Text("Loading...", style: TextStyle(fontSize: 30, color: Colors.blue),),
          ),
        ],
      ),
    );
  }

  Widget getErrorUi(String error) {
    return Center(
      child: Text(error, style: const TextStyle(color: Colors.red, fontSize: 30.0),),
    );
  }

  Widget getBody(Pets pets) {
    return ListView.builder(
      itemCount: pets.data.length, itemBuilder: (context, index) => ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(pets.data[index].petImage),
        backgroundColor: Colors.grey,
      ),
      trailing: pets.data[index].isFriendly ? const Icon(Icons.pets, color:  Colors.green,) : const Icon(Icons.pets, color: Colors.red,),
      title: Text(pets.data[index].userName, style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(pets.data[index].petName),
  ),);
  }
}
