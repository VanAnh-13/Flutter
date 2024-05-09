class Distinct {
  String? districtId;
  String? districtName;
  String? districtType;
  String? lat;
  String? lng;
  String? provinceId;

  Distinct(
      {this.districtId,
        this.districtName,
        this.districtType,
        this.lat,
        this.lng,
        this.provinceId});

  Distinct.fromJson(Map<String, dynamic> json) {
    districtId = json['district_id'];
    districtName = json['district_name'];
    districtType = json['district_type'];
    lat = json['lat'];
    lng = json['lng'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['district_type'] = districtType;
    data['lat'] = lat;
    data['lng'] = lng;
    data['province_id'] = provinceId;
    return data;
  }
}
