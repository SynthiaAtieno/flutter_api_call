import 'package:flutter/cupertino.dart';
import 'package:flutter_api_practice/models/pets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PetsProvider extends ChangeNotifier{
  static const endPoint = 'https://jatinderji.github.io/users_pets_api/users_pets.json';
  String error = '';
  bool isLoading = true;
  Pets pets = Pets(data: []);


  getDataFromApi() async{
    try{
      var url = Uri.parse(endPoint);
      Response response = await http.get(url);
      if(response.statusCode == 200){
        pets =petsFromJson(response.body);
      }else{
        error = response.statusCode.toString();
      }
    }
    catch(e){
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}