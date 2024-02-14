
class Level6Model {

  final int? level6ID;
  final int? level5ID;
  final String level6Name;

  Level6Model({required this.level6ID, required this.level5ID, required this.level6Name});

  Level6Model.fromMap(Map<String, dynamic> res):
      level5ID = res['Level5ID'],
       level6ID = res['Level6Id'],
         level6Name = res['Level6Name'];

  Map<String, Object?> toMap(){
    return {
      'Level5ID': level5ID,
      'Level6Id': level6ID,
      'Level6Name': level6Name
    };
  }


}