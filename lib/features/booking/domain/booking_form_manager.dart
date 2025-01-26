import 'package:flutter/widgets.dart';

class BookingFormManager {
  BookingFormManager();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final List<TouristInfo> _touristsInfo = [];

  List<TouristInfo> get touristsInfo => _touristsInfo;

  void addTouristInfo(TouristInfo touristInfo) {
    _touristsInfo.add(touristInfo);
  }

  void removeTouristInfo(int index) {
    _touristsInfo.removeAt(index);
  }

  bool validateTouristsEmptyFields() {
    bool valid = true;
    for (var tourist in _touristsInfo) {
      valid = valid &&
          tourist.firstNameController.text.isNotEmpty &&
          tourist.lastNameController.text.isNotEmpty &&
          tourist.dateOfBirthController.text.isNotEmpty &&
          tourist.citizenshipController.text.isNotEmpty &&
          tourist.passportController.text.isNotEmpty &&
          tourist.passportExpirationDateController.text.isNotEmpty;
    }
    return valid;
  }
}

class TouristInfo {
  TouristInfo();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController citizenshipController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController passportExpirationDateController =
      TextEditingController();
}
