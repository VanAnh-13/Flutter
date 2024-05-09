class Provinces {
  String? provinceId;
  String? provinceName;
  String? provinceType;

  Provinces({this.provinceId, this.provinceName, this.provinceType});

   Provinces.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    provinceName = json['province_name'];
    provinceType = json['province_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['province_id'] = provinceId;
    data['province_name'] = provinceName;
    data['province_type'] = provinceType;
    return data;
  }
}
