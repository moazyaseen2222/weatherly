import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();


  static removeData(String key)async{
   SharedPreferences sharedPref = await SharedPreferences.getInstance();
   await sharedPref.remove(key);
  }

  static clearAllData()async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
   await sharedPref.clear();
  }

  static setData (String key,value) async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    switch (value.runtimeType){
      case String:
        await sharedPref.setString(key, value);
        break;
      case bool:
        await sharedPref.setBool(key, value);
        break; 
      case int:
        await sharedPref.setInt(key, value);
        break;  
      case double:
        await sharedPref.setDouble(key, value);
        break;   
      default:
          return null;
    }
  }


  static getBool (String key)async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.getBool(key) ?? false;
  }

  static getString (String key)async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.getString(key) ?? '';
  }
  static getInt (String key)async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.getInt(key) ?? 0;
  }
  static getDouble (String key)async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.getDouble(key) ?? 0.0 ;
  }



}