
class Level3Model {
  final int? level2ID;
  final int? level3ID;
  final String level3Name;

  Level3Model({required this.level2ID, required this.level3ID, required this.level3Name});

  Level3Model.fromMap(Map<String, dynamic> res):
      level3Name = res['Level3Name'],
       level2ID = res['Level2id'],
         level3ID = res['Level3ID'];

  Map<String, Object?> toMap(){
    return {
      'Level3Name': level3Name,
      'Level2id': level2ID,
      'Level3ID': level3ID
    };
  }


}