import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreference {
  static SharedPreferences? _preferences = null;

  //keys
  static const _keyUserName = "username";
  static const _keyAge = "age_key";
  static const _keyTempreture = "tempreture_key";
  static const _keyGender = "gender_key";
  static const _keyPetList = "pet_list";
  static const _keyDateTime = "date_time";


  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  /**************************** set get string ****************************/
  // set String
  static Future setStringUserName(String name) async =>
      await _preferences?.setString(_keyUserName, name);

  // get string
  static String? getStringUserName() => _preferences?.getString(_keyUserName);


  /**************************** set get int ****************************/
  // set String
  static Future setIntAge(int age) async =>
      await _preferences?.setInt(_keyAge, age);

  // get string
  static int? getIntAge() => _preferences?.getInt(_keyAge);


  /**************************** set get double ****************************/
  // set String
  static Future setDoubleTempreture(double tempreture) async =>
      await _preferences?.setDouble(_keyTempreture, tempreture);

  // get string
  static double? getDoubleTempreture() => _preferences?.getDouble(_keyTempreture);


  /**************************** set get bool ****************************/
  // set String
  static Future setBoolGender(bool gender) async =>
      await _preferences?.setBool(_keyGender, gender);

  // get string
  static bool? getBoolGender() => _preferences?.getBool(_keyGender);



  /**************************** set get string list ****************************/
  // set list
  static Future setPetList(List<String> petList) async =>
      await _preferences?.setStringList(_keyPetList, petList);

// get list
  static List<String>? getPetList() => _preferences?.getStringList(_keyPetList);

  /**************************** set get DateTime ****************************/

  // set date
  static Future setBirthDay(DateTime dateOfBirth) async {
    final birthDay = dateOfBirth.toIso8601String();
    return await _preferences?.setString(_keyDateTime, birthDay);
  }

  // get date
  static DateTime? getBirthDay(){
    final birthday = _preferences?.getString(_keyDateTime);
    // return DateTime.tryParse(birthday!);
    return birthday == null ? null : DateTime.tryParse(birthday);
  }


}
