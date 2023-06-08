import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPrefs();

//
//   Future<void> removeUserData() async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setString("name", '');
//     await prefs.setString("user_type", '');
//     await prefs.setString("email", '');
//     await prefs.setString("phone", '');
//     await prefs.setString("image", '');
//     await prefs.setString("token", '');
//     await prefs.setString("send_code", '');
//
//   //  isLogged = false;
//   }
//
//   // Future<void> saveUserData(UserData userData) async {
//   //   final SharedPreferences prefs = await _prefs;
//   //   await prefs.setString("name", userData.name ?? '');
//   //   await prefs.setString("user_type", userData.user_type ?? 'user');
//   //   await prefs.setString("email", userData.email ?? '');
//   //   await prefs.setString("phone", userData.phone ?? '');
//   //   await prefs.setString("image", userData.image ?? '');
//   //   await prefs.setString("token", userData.token ?? '');
//   //   await prefs.setString("send_code", userData.send_code ?? '');
//   // }

  // Future<void> saveUserData(UserLoginResponse userData) async {
  //   final SharedPreferences prefs = await _prefs;
  //   await prefs.setInt("id", userData.data?.id ?? 0);
  //   await prefs.setBool("isFirstTime", userData.data?.isFirstTime ?? true);
  //   await prefs.setString("name", '${userData.data?.name ?? ''}');
  //   await prefs.setString("brief", '${userData.data?.brief ?? ''}');
  //   await prefs.setString("image", '${userData.data?.image ?? ''}');
  //   await prefs.setString("apiToken", '${userData.data?.apiToken ?? ''}');
  //   await prefs.setString(
  //       "categoryName", '${userData.data?.categoryName ?? ''}');
  //   await prefs.setInt("notifiable", userData.data?.notifiable ?? 0);
  //   await prefs.setString("role", '${userData.data?.role ?? ''}');
  // }

  Future<void> removeUserData() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt("id", 0);
    await prefs.setBool("isFirstTime", true);
    await prefs.setString("name", '');
    await prefs.setString("brief", '');
    await prefs.setString("image", '');
    await prefs.setString("apiToken", '');
    await prefs.setString("categoryName", '');
    await prefs.setInt("notifiable", 0);
    await prefs.setString("role", '');
  }

  // Future<Data> getUserData() async {
  //   final SharedPreferences prefs = await _prefs;
  //
  //   Data response = Data();
  //   response.id = 10; //prefs.getInt('id');
  //   response.isFirstTime = prefs.getBool('isFirstTime');
  //   response.name = prefs.getString('name');
  //   response.brief = prefs.getString('brief');
  //   response.image = prefs.getString('image');
  //   response.apiToken = prefs.getString('apiToken');
  //   response.categoryName = prefs.getString('categoryName');
  //   response.notifiable = prefs.getInt('notifiable');
  //   response.role = prefs.getString('role');
  //
  //   return response;
  // }

  Future<void> saveUserDataToken(String userData) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("token", userData);

    //  isLogged = true;
  }

//   Future<void> saveUserDataName(String userData) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setString("name", userData);
//   }

  Future<void> saveAppLang(String lang) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("lang", lang);
  }

//
//   Future<void> saveUserDataPhone(String userData) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setString("phone", userData);
//   }
//
//   Future<String?> getUserToken() async {
//     final SharedPreferences prefs = await _prefs;
//     String? text = prefs.getString('token');
//     return text;
//   }
//
//   Future<String?> getUserType() async {
//     final SharedPreferences prefs = await _prefs;
//     String? text = prefs.getString('user_type');
//     return text ?? 'user';
//   }
//
//   Future<String?> getUserName() async {
//     final SharedPreferences prefs = await _prefs;
//     String? text = prefs.getString('name');
//     return text;
//   }

  Future<String?> getAppLang() async {
    final SharedPreferences prefs = await _prefs;
    String? text = prefs.getString('lang') ?? Get.deviceLocale.toString();
    return text;
  }

  Future<String?> getUserDataToken() async {
    final SharedPreferences prefs = await _prefs;
    String? text = prefs.getString('token') ?? '';
    return text;
  }

//   Future<String?> getUserPhone() async {
//     final SharedPreferences prefs = await _prefs;
//     String? text = prefs.getString('phone');
//     return text;
//   }
//
//   Future<String?> getUserImg() async {
//     final SharedPreferences prefs = await _prefs;
//     String? text = prefs.getString('image');
//     return text;
//   }
//
//   Future<String?> getUserEmail() async {
//     final SharedPreferences prefs = await _prefs;
//     String? text = prefs.getString('email');
//     return text;
//   }
//
//   Future<void> saveAppColors(String color) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setString("app_color", color);
//   }
//
//   Future<String?> getAppColorString() async {
//     final SharedPreferences prefs = await _prefs;
//     String? text = prefs.getString('app_color');
//     return text;
//   }
//
//   Future<void> saveAppLang(String lang) async {
//     final SharedPreferences prefs = await _prefs;
//     await prefs.setString("app_lang", lang);
//   }
//
//   Future<String> getAppLang() async {
//     final SharedPreferences prefs = await _prefs;
//     String text = prefs.getString('app_lang') ?? 'en';
//     return text;
//   }
//
//   // Future<Color> getAppColor() async {
//   //   final String color = await getAppColorString() ?? '0';
//   //   print('getAppColor :  $color');
//   //   if (color == '0') {
//   //     return AppColors.yellowAppColor;
//   //   } else if (color == '1') {
//   //     return AppColors.greenAppColor;
//   //   } else if (color == '2') {
//   //     return AppColors.redAppColor;
//   //   } else if (color == '3') {
//   //     return AppColors.purpleAppColor;
//   //   } else {
//   //     return AppColors.yellowAppColor;
//   //   }
//   // }
}
