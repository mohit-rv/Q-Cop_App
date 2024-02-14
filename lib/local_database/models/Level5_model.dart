

class Level5Model {

  final int? level5ID;
  final int? level4ID;
  final String level5Name;

  Level5Model({required this.level5ID, required this.level4ID, required this.level5Name});

  Level5Model.fromMap(Map<String, dynamic> res):
      level4ID = res['Level4Id'],
      level5Name = res['Level5Name'],
      level5ID = res['Level5ID'];

  Map<String, Object?> toMap(){
    return {
      'Level4Id': level4ID,
      'Level5Name': level5Name,
      'Level5ID': level5ID
    };
  }


}