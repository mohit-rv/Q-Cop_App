class Level4ResponseModel {
  int? level4ID;
  int? level3Id;
  String? level4Code;
  String? level4Name;
  String? level4DwgPath;
  int? pID;

  Level4ResponseModel(
      {this.level4ID,
        this.level3Id,
        this.level4Code,
        this.level4Name,
        this.level4DwgPath,
        this.pID});

  Level4ResponseModel.fromJson(Map<String, dynamic> json) {
    level4ID = json['level4ID'];
    level3Id = json['level3Id'];
    level4Code = json['level4Code'];
    level4Name = json['level4Name'];
    level4DwgPath = json['level4DwgPath'];
    pID = json['PID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level4ID'] = this.level4ID;
    data['level3Id'] = this.level3Id;
    data['level4Code'] = this.level4Code;
    data['level4Name'] = this.level4Name;
    data['level4DwgPath'] = this.level4DwgPath;
    data['PID'] = this.pID;
    return data;
  }
}