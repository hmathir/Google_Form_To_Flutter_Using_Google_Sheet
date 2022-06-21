import 'package:http/http.dart' as http;
import 'package:testing/app/modules/home/model/datamodel.dart';

class RemoteService {
  Future<List<DataModel>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://script.google.com/macros/s/AKfycbzYW4f7tZmoNyON6MUnzWMUkAX5SbbrBXUQ3ua3jKrMIFOdtPxsLW2B2rzQkHlavt3X/exec');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      return dataModelFromJson(data);
    }
    return null;
  }
}
