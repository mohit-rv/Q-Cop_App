
class Level4Model {

  final int? level4ID;
  final int? level3ID;
  final String level4Name;

  Level4Model({required this.level4ID, required this.level3ID, required this.level4Name});


  Level4Model.fromMap(Map<String, dynamic> res):
      level3ID = res['Level3ID'],
       level4ID = res['Level4ID'],
         level4Name = res['Level4Name'];

  Map<String, Object?> toMap(){
    return {
      'Level3ID': level3ID,
      'Level4ID': level4ID,
      'Level4Name': level4Name
    };
  }

}