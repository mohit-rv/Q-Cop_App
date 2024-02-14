
class Level2Response {
  int? level2ID;
  int? level1ID;
  String? level2Code;
  String? level2Name;
  String? level2Description;
  int? pID;
  String? active;

  Level2Response(
      {this.level2ID,
        this.level1ID,
        this.level2Code,
        this.level2Name,
        this.level2Description,
        this.pID,
        this.active});

  Level2Response.fromJson(Map<String, dynamic> json) {
    level2ID = json['level2ID'];
    level1ID = json['level1ID'];
    level2Code = json['level2Code'];
    level2Name = json['level2Name'];
    level2Description = json['level2Description'];
    pID = json['PID'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level2ID'] = this.level2ID;
    data['level1ID'] = this.level1ID;
    data['level2Code'] = this.level2Code;
    data['level2Name'] = this.level2Name;
    data['level2Description'] = this.level2Description;
    data['PID'] = this.pID;
    data['Active'] = this.active;
    return data;
  }
}