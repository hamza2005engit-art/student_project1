import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:student_project1/features/auth/data/models/first_forgetpassword_model.dart';
import 'package:student_project1/features/auth/data/models/forgetpassword_model.dart';
import 'package:student_project1/features/auth/domain/entities/first_forgetpassword_user.dart';
import 'package:student_project1/features/auth/domain/entities/register_user.dart';


import '../models/registeruser_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
Future<RegisterUserModel> register(RegisterUser registeruser);
  Future<FirstForgetPasswordModel> firstforgetpassword(FirstForgetpasswordUser firstforgetpassworduser);
  Future<ForgetPasswordModel> forgetpassword(
   String email,
   String ip,
   String new_password,
   String confirmed_password,

      );
}


class AuthRemoteDataSourceImpl extends GetConnect implements AuthRemoteDataSource {
final String baseUrl = "http://10.0.2.2:8000/api/v1";
@override
Future<UserModel> login(String email, String password) async {
  // استخدم baseUrl بدلاً من localhost
  final response = await post('/login', {
    'email': email,
    'password': password,
  }, headers: {
    'Accept': 'application/json',
  });

  print("Status: ${response.statusCode}");
  print("Body: ${response.body}");

  if (response.status.hasError) {
    // طباعة الخطأ القادم من السيرفر للمساعدة في التشخيص
    throw Exception(response.body?['error'] ?? "Login Failed");
  } else {
    // السيرفر يرسل الخريطة كاملة وبداخلها 'user'
    // والموديل غالباً يتوقع الخريطة كاملة ليبحث عن 'user' بالداخل
    // أو إذا كان الموديل يأخذ بيانات المستخدم مباشرة فاستخدم السطر التالي:

    if (response.body != null) {
      return UserModel.fromJson(response.body);
      // مررنا الخريطة كاملة {token: ..., user: {...}}
      // لكي يتمكن الموديل من قراءة التوكن واليوزر معاً
    } else {
      throw Exception("الرد من السيرفر فارغ");
    }
  }
}

  @override
  Future<RegisterUserModel> register(RegisterUser user) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/register'));

    // إضافة الحقول النصية (يجب أن تطابق الـ Request في Laravel)
    request.fields.addAll({
      'full_name': user.fullName,
      'email': user.email,
      'phone': user.phone,
      'password': user.password,
      'password_confirmation': user.passwordConfirmation,
      'role': user.role,
      'location': user.location,
    });

    // إضافة الصورة
    if (user.profileImagePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image', // المفتاح المتوقع في Laravel
        user.profileImagePath,
      ));
    }

    request.headers.addAll({'Accept': 'application/json'});

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      return RegisterUserModel.fromJson(json.decode(response.body));
    } else {
      final errorData = json.decode(response.body);
      throw Exception(errorData['message'] ?? "Registration Failed");
    }
  }




@override
Future<ForgetPasswordModel> forgetpassword(
    String email,
    String ip,
    String new_password,
    String confirmed_password,
    ) async {
  // استخدم baseUrl بدلاً من الرابط الوهمي
  final response = await post('$baseUrl/forgetpassword', {
    'email': email,
    'ip': ip,
    'new_password': new_password,
    'confirmed_password': confirmed_password,
  }, headers: {
    'Accept': 'application/json',
  });

  if (response.status.hasError) {
    throw Exception(response.body?['message'] ?? "Password Reset Failed");
  } else {
    return ForgetPasswordModel.fromJson(response.body['data']);
  }
}

  @override
  Future<FirstForgetPasswordModel> firstforgetpassword(FirstForgetpasswordUser firstforgetpassworduser) async {
    // نستخدم المسار فقط لأن GetConnect يستخدم baseUrl المعرف في الكلاس
    final response = await post('$baseUrl/forget_password', {
      'email': firstforgetpassworduser.email, // الوصول للإيميل من الكائن الممرر
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.status.hasError) {
      // جلب رسالة الخطأ من السيرفر إذا وجدت
      throw Exception(response.body?['message'] ?? "Password Reset Failed");
    } else {
      // تأكد من شكل الرد، إذا كان الموديل يأخذ الـ body كاملاً أو جزء 'data'
      return FirstForgetPasswordModel.fromJson(response.body);
    }
  }
}