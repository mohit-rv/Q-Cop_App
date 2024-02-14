class Level5ResponseModel {
  int? level5ID;
  int? level4ID;
  String? level5Code;
  String? level5Name;
  String? level5DwgPath;
  int? pID;

  Level5ResponseModel(
      {this.level5ID,
        this.level4ID,
        this.level5Code,
        this.level5Name,
        this.level5DwgPath,
        this.pID});

  Level5ResponseModel.fromJson(Map<String, dynamic> json) {
    level5ID = json['level5ID'];
    level4ID = json['level4ID'];
    level5Code = json['level5Code'];
    level5Name = json['level5Name'];
    level5DwgPath = json['level5DwgPath'];
    pID = json['PID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level5ID'] = this.level5ID;
    data['level4ID'] = this.level4ID;
    data['level5Code'] = this.level5Code;
    data['level5Name'] = this.level5Name;
    data['level5DwgPath'] = this.level5DwgPath;
    data['PID'] = this.pID;
    return data;
  }
}
