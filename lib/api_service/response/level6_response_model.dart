

class Level6ResponseModel {
  int? level6ID;
  int? level5ID;
  String? level6Code;
  String? level6Name;
  String? level6DwgPath;
  int? pID;

  Level6ResponseModel(
      {this.level6ID,
        this.level5ID,
        this.level6Code,
        this.level6Name,
        this.level6DwgPath,
        this.pID});

  Level6ResponseModel.fromJson(Map<String, dynamic> json) {
    level6ID = json['level6ID'];
    level5ID = json['level5ID'];
    level6Code = json['level6Code'];
    level6Name = json['level6Name'];
    level6DwgPath = json['level6DwgPath'];
    pID = json['PID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level6ID'] = this.level6ID;
    data['level5ID'] = this.level5ID;
    data['level6Code'] = this.level6Code;
    data['level6Name'] = this.level6Name;
    data['level6DwgPath'] = this.level6DwgPath;
    data['PID'] = this.pID;
    return data;
  }
}
