import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class HomeController extends GetxController with StateMixin {
  //TODO: Implement HomeController

  LocationData? locationData; // = LocationData.fromMap({}).obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  late User? user;
  @override
  void onInit() {
    super.onInit();
    user = auth.currentUser;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
