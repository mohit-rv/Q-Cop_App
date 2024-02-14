class Qalevel {
  int? level1ID;
  int? pid;
  String? level1Code;
  String? level1Name;
  String? level1Description;

  Qalevel(
      {this.level1ID,
        this.pid,
        this.level1Code,
        this.level1Name,
        this.level1Description});

  Qalevel.fromJson(Map<String, dynamic> json) {
    level1ID = json['level1ID'];
    pid = json['pid'];
    level1Code = json['level1Code'];
    level1Name = json['level1Name'];
    level1Description = json['level1Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level1ID'] = this.level1ID;
    data['pid'] = this.pid;
    data['level1Code'] = this.level1Code;
    data['level1Name'] = this.level1Name;
    data['level1Description'] = this.level1Description;
    return data;
  }
}