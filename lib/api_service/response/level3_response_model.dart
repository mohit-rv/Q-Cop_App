
class level3Response {
  int? level3ID;
  int? level2ID;
  String? level3Code;
  String? level3Name;
  String? level3DwgPath;
  int? pID;

  level3Response(
      {this.level3ID,
        this.level2ID,
        this.level3Code,
        this.level3Name,
        this.level3DwgPath,
        this.pID});

  level3Response.fromJson(Map<String, dynamic> json) {
    level3ID = json['level3ID'];
    level2ID = json['level2ID'];
    level3Code = json['level3Code'];
    level3Name = json['level3Name'];
    level3DwgPath = json['level3DwgPath'];
    pID = json['PID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level3ID'] = this.level3ID;
    data['level2ID'] = this.level2ID;
    data['level3Code'] = this.level3Code;
    data['level3Name'] = this.level3Name;
    data['level3DwgPath'] = this.level3DwgPath;
    data['PID'] = this.pID;
    return data;
  }
}