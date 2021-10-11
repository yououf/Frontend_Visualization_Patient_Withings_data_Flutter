class RegionZipCodes {
  int id;
  int regionId;
  String regionName;
  int regionTypeId;
  String regionTypeName;
  int zipCodeStart;
  int zipCodeEnd;

  RegionZipCodes(
      {this.id,
      this.regionId,
      this.regionName,
      this.regionTypeId,
      this.regionTypeName,
      this.zipCodeStart,
      this.zipCodeEnd});

  RegionZipCodes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    regionId = json["region_id"];
    regionName = json["region_name"];
    regionTypeId = json["region_type_id"];
    zipCodeStart = json["zip_code_start"];
    zipCodeEnd = json["zip_code_end"];
  }
}

class RegionZipCodesIdName {
  int regionTypeId;
  String regionTypeName;

  RegionZipCodesIdName({this.regionTypeId, this.regionTypeName});

  RegionZipCodesIdName.fromJson(Map<String, dynamic> json) {
    regionTypeId = json['RegType_Id_int'];
    regionTypeName = json['RegType_Name_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region_type_id'] = this.regionTypeId;
    data['region_type_name'] = this.regionTypeName;
    return data;
  }
}

class Region {
  int regionId;
  String regionName;

  Region({this.regionId, this.regionName});

  Region.fromJson(Map<String, dynamic> json) {
    regionId = json['region_id'];
    regionName = json['region_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region_id'] = this.regionId;
    data['region_name'] = this.regionName;
    return data;
  }
}
