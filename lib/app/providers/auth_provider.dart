import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) => User.fromJson(map);
    // httpClient.baseUrl = ApiService.baseUrl;
  }

  Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Response> login(String phone, String password) async {
    return await post(
      '/login',
      {
        'phone': phone,
        'password': password,
      },
      decoder: (data) {},
    );
  }

  Future<Response> register(String username, String password) async {
    return await post(
      '/register',
      {'username': username, 'password': password},
    );
  }

  Future<Response> logout() async {
    return await post(
      '/logout',
      {},
    );
  }
}
