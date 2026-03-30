import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
 static Dio dio=Dio();
static Future<bool> login({required String email ,required String password})async{
    try{
      final response=await dio.post('https://codingarabic.online/api/login',
      data: {
        'email':email,
        'password':password
      }
      );
      if(response.statusCode==200){
        saveUserToken(token:response.data['data']['token']);
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e);
      return false;
    }
    }
   static Future<bool> register({required String name,  required String email,required String confirmPassword,required String password})async{
   try{
     final response=await dio.post('https://codingarabic.online/api/register',
         data: {
            'name':name,
           'email':email,
           'password':password,
           'password_confirmation':confirmPassword,
         }
     );if(response.statusCode==201){

       return true;
     }else{
       return false;
     }
   } on DioException catch(e){
     return false;
     print(e);
   }
   }
  static Future<void>  saveUserToken({required String token})async{
        final SharedPreferences prefs=await SharedPreferences.getInstance();
        prefs.setString('token', token);
        print('=========================');
        print('token saved successfully');
   }
}