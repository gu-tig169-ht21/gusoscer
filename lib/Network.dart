import 'package:flutter/cupertino.dart';

import './Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './NewTodo.dart';

const API_KEY = 'e83d76d4-b80b-448a-9a4c-3881b86c1c24';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<Todo>> add_activityApi(Todo activity) async {
    Map<String, dynamic> json = Todo.toJson(activity);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    print(bodyString);
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {  //data? 
      return Todo.fromJson(data);
    }).toList();
  }
  
  static Future delete_ActivityApi(String activityId) async {
    var response = await http.delete(
      Uri.parse('$API_URL/todos/:$activityId?key=$API_KEY&_confirm=true')); //ta bort kolon? kanske också confirmtrue..
      var bodyString = response.body;
      var list = jsonDecode(bodyString);

      return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future<List<Todo>> getActivitesApi() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'),
    //headers: {'Content-Type': 'application/json'}
    );
    
    String bodyString = response.body; //kanske inte ska va en string? eftersom bool också?
    
    print(bodyString);
    var json = jsonDecode(bodyString);

    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }
}
/*
class InternetFetcher {
  static Future<String> fetchIp() async {                 
  http.Response response = await http.get(Uri.parse('https://api.myip.com/'));
  var jsonData = response.body;     
  var obj = jsonDecode(jsonData);
  return obj['ip'];
}
}
void _doStuff() async {
  var result = await InternetFetcher.fetchIp();
  //print(result);
  setState(() {
    ip = result;
  }
  );
}

class IpWidget extends StatefulWidget {
  @override
  _IpWidgetState createState() => _IpWidgetState();
}

class _IpWidgetState extends State<IpWidget> {
  String ip = 'ip';

  void initState() {
    super.initState();  //körs bara 1 gång, så det inte loopar
    _fetchIp();
  }

  Widget build(BuildContext context) {
    

    return Text(ip);
  }
  void _fetchIp() async {
    var newIp = await InternetFetcher.fetchIp();
    setState(() {
      ip = newIp;
    });
  }
}  
*/


/*
void doStuff() async {
  print("nutid");
  var result = await fetchStuffFromInternet();
  print("framtiden");
  print(result);
}


Future<String> fetchStuffFromInternet() async {                     //hämtar från adressen, väntar på svar, returnera body i vårt fall
  http.Response response = await http.get('https://todoapp-api-pyq5q.ondigitalocean.app/register'); //pausar exekveringen tills vi fått svar från servern
  var jsonData = response.body;     //svaret från servern är en json-sträng
  var obj = jsonDecode(jsonData);   //dekonstruerat svaret från servern till ett objekt vi kan förstå, få ut data ifrån
  return '${obj['ip']} i landet ${obj['country']}';   //använda datan, i detta fall skriva ut sträng

  //kommer returnera i json-format.
  //"ip": <- property "32.245.42.322", <- värde
  //omges av måsvingar
  // "array": [1,2,3,4, "mat", true] array, object, strängar, nummer kan sparas i json. i Json är "array": nyckel.
}
*/
