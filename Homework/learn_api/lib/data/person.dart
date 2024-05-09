class Person {
  String? name;
  int? age;
  String? phoneNumber;
  bool? isCustomer;
  String? province;
  String? district;
  String? id;

  Person(
      {this.name,
      this.age,
      this.phoneNumber,
      this.isCustomer,
      this.province,
      this.district,
      this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['age'] = age;
    data['phone_number'] = phoneNumber;
    data['is_custommer'] = isCustomer;
    data['provice'] = province;
    data['district'] = district;
    data['id'] = id;

    return data;
  }

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    phoneNumber = json['phone_number'];
    isCustomer = json['is_custommer'];
    province = json['provice'];
    district = json['district'];
    id = json['id'];
  }
}
