

class Level2Model {

    final int? level2ID;
    final int? level1ID;
    final String level2Name;
    final String Active;

  Level2Model({required this.level2ID, required this.level1ID, required this.level2Name, required this.Active});

    Level2Model.fromMap(Map<String, dynamic> res):
        level2ID = res['Level2id'],
         level1ID= res['level1ID'],
          level2Name = res['Level2Name'],
           Active = res['active'];

    Map<String, Object?> toMap(){
      return {
        'Level2id': level2ID,
        'level1ID': level1ID,
        'Level2Name': level2Name,
        'active': Active
      };
    }


}