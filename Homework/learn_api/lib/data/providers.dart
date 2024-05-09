import 'package:flutter/material.dart';
import 'package:learn_api/data/distinct.dart';
import 'package:learn_api/data/person.dart';
import 'package:learn_api/data/provinces.dart';
import 'package:learn_api/data/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PersonProvider extends ChangeNotifier {
  bool isLoadingPerson = false;
  late List<Person> persons;

  void getPersonData() async {
    isLoadingPerson = true;
    persons = await PersonService.getData();
    isLoadingPerson = false;
    notifyListeners();
  }

  static Future<bool> postPerson(Person person) async {
    http.Response response = await PersonService.createPerson(person);

    return response.statusCode == 201;
  }

  static Future<bool> updatePerson(Person person, String personId) async {
    http.Response response = await PersonService.updatePerson(person, personId);

    return response.statusCode == 200;
  }

  static Future<bool> deletePerson(String personId) async {
    http.Response response = await PersonService.deletePerson(personId);

    return response.statusCode == 200;
  }
}

class ProvinceProvider extends ChangeNotifier {
  bool isLoadingProvinces = false;
  static late List<Provinces> provinces;

  void getProvinces() async {
    isLoadingProvinces = true;
    provinces = await ProvinceService.getProvinces();
    isLoadingProvinces = false;
    notifyListeners();
  }
}

class DistinctProvider extends ChangeNotifier {
  bool isLoadingDistinct = false;
  static late List<Distinct> distinct;

  void getDistinct(String? provinceId) async {
    isLoadingDistinct = true;
    distinct = await DistinctService.getDistinct(provinceId);
    isLoadingDistinct = false;
    notifyListeners();
  }
}

class PartnerAdd extends ChangeNotifier {
  int age = 0;
  String? partner;
  String? provinceId;
  String? distinctId;
  late Person personAdd;

  void addAge(bool isIncrease) {
    if (isIncrease) {
      age++;
    } else if (!isIncrease && age > 0) {
      age--;
    }
    notifyListeners();
  }

  void addPartner(String type) {
    partner = type;
    notifyListeners();
  }

  void addProvince(String? id) {
    provinceId = id;
    notifyListeners();
  }

  void addDistinct(String? id) {
    distinctId = id;
    notifyListeners();
  }

  void createPartner(String name, String? phoneNumber) {
    bool isCustomer = partner == 'Client';

    Provinces? province;
    Distinct? distinct;

    if (provinceId != null) {
      province = ProvinceProvider.provinces.elementAt(
        ProvinceProvider.provinces.indexWhere(
          (element) => element.provinceId == provinceId,
        ),
      );
    }

    if (distinctId != null) {
      distinct = DistinctProvider.distinct.elementAt(
        DistinctProvider.distinct.indexWhere(
          (element) => element.districtId == distinctId,
        ),
      );
    }

    personAdd = Person(
        name: name,
        age: age,
        phoneNumber: phoneNumber == "" ? null : phoneNumber,
        isCustomer: isCustomer,
        province: province?.provinceName,
        district: distinct?.districtName);

    notifyListeners();
  }

  static addPerson(BuildContext context, String name, String? phoneNumber,
      bool isAdd, String personId) async {
    if(isAdd) {
      Provider.of<PartnerAdd>(context, listen: false)
          .createPartner(name, phoneNumber);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: await PersonProvider.postPerson(
            Provider.of<PartnerAdd>(context, listen: false).personAdd,
          )
              ? const Text("Successful")
              : const Text("Error"),
        ),
      );

      if (context.mounted) {
        context.read<PersonProvider>().getPersonData();

        Navigator.pop(context);
      }
    } else {
      Provider.of<PartnerAdd>(context, listen: false)
          .createPartner(name, phoneNumber);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: await PersonProvider.updatePerson(
            Provider.of<PartnerAdd>(context, listen: false).personAdd,
            personId
          )
              ? const Text("Successful")
              : const Text("Error"),
        ),
      );

      if (context.mounted) {
        context.read<PersonProvider>().getPersonData();

        Navigator.pop(context);
        Navigator.pop(context);
      }
    }
  }

  static deletePerson(BuildContext context, String personId) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: await PersonProvider.deletePerson(personId)
        ? const Text("Successful")
        : const Text("Error"),
    ),
    );

    if (context.mounted) {
    context.read<PersonProvider>().getPersonData();

    Navigator.pop(context);
    }
  }
}
