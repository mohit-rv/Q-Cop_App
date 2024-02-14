
import 'dart:io'as io;
import 'package:path_provider/path_provider.dart';
import 'package:qcop/api_service/api_service.dart';
import 'package:qcop/local_database/models/Level5_model.dart';
import 'package:qcop/local_database/models/level2_model.dart';
import 'package:qcop/local_database/models/level3_model.dart';
import 'package:qcop/local_database/models/level4_model.dart';
import 'package:qcop/local_database/models/level6_model.dart';
import 'package:qcop/local_database/models/project_models.dart';
import 'package:qcop/local_database/models/qa_level1_model.dart';
import 'package:qcop/local_database/models/usermapping.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../api_service/response/project_list_response_model.dart';
import 'models/level3_model.dart';
import 'models/users_model.dart';

class SqfDataBase {

  static Database? _db;

  Future<Database?> get db async{
    if(_db == null){
      _db = await initDatabase();
      return _db;
    }
    else{
      _db = await initDatabase();
      return _db;
    }
  }

  initDatabase()async{

  io.Directory documentDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentDirectory.path, 'tblProject.db');
 // print('Database path : $path');
  var db = await openDatabase(path, version: 1,onCreate: createDatabaseTable);
  return db;
  // return await openDatabase(        //this is wronway of creating database tables
  //     path,
  //     version: 1,
  //   onCreate: (Database db, int version) async{
  //    // await crateProjectTable(db,2);
  //    // await createUserMappingtable(db,);
  //    // await createUsersTable(db);
  //     await db.execute("CREATE TABLE tblProject (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,PID INTEGER ,ProjectCode TEXT,"
  //         "ProjectName TEXT NOT NULL,ProjectDescription TEXT,Status TEXT"
  //     );
  //     await db.execute(
  //         'CREATE TABLE tblUserMapping (UID INTEGER,PrjID INTEGER,PrjAccess TEXT,QaAccess TEXT,HseAccess TEXT'
  //             ',SnagAccess TEXT,ObsAccess TEXT,BoqAccess TEXT,PmAccess TEXT,MatAccess TEXT,DlrAccess TEXT)');
  //     await db.execute(
  //         'CREATE TABLE tblUsers (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,uid LONG,LoginName TEXT NOT NULL,'
  //             'Password TEXT NOT NULL,FirstName TEXT'
  //             ',LastName TEXT,AccessRights TEXT,'
  //             'Designation TEXT,PAssigned TEXT,Active TEXT,CompanyID INTEGER'
  //     );
  //
  //
  //   }
  // );

  }


  createDatabaseTable(Database db, int version)async{
     await db.execute(
         'CREATE TABLE tblUsers (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,uid INTEGER UNIQUE,LoginName TEXT NOT NULL,'
             'Password TEXT NOT NULL,FirstName TEXT'
             ',LastName TEXT,AccessRights TEXT,'
             'Designation TEXT,PAssigned TEXT,Active TEXT,CompanyID INTEGER)'
     );

     await db.execute('CREATE TABLE tblProject (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT ,PID INTEGER UNIQUE,ProjectCode TEXT,'
         'ProjectName TEXT NOT NULL,ProjectDescription TEXT,Status TEXT)'
     );
     await db.execute(
         'CREATE TABLE tblUserMapping (UID INTEGER ,PrjID INTEGER,PrjAccess TEXT,QaAccess TEXT,HseAccess TEXT'
             ',SnagAccess TEXT,ObsAccess TEXT,BoqAccess TEXT,PmAccess TEXT,MatAccess TEXT,DlrAccess TEXT)');
     await db.execute('CREATE TABLE tblLevel1 (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,level1ID INTEGER,pid INTEGER,level1Name TEXT)');
     await db.execute('CREATE TABLE tblLevel2 (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,level2ID INTEGER,level1ID INTEGER,level2Name TEXT,Active TEXT)');
     await db.execute('CREATE TABLE tblLevel3 (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,level3ID INTEGER,level2ID INTEGER,level3Name TEXT)');
     await db.execute('CREATE TABLE tblLevel4 (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,level4ID INTEGER,level3ID INTEGER,level4Name TEXT)');
     await db.execute('CREATE TABLE tblLevel5 (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,level5ID INTEGER,level4ID INTEGER,level5Name TEXT)');
     await db.execute('CREATE TABLE tblLevel6 (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,level6ID INTEGER,level5ID INTEGER,level6Name TEXT)');
  }



  Future<ProjectModel> insert(ProjectModel projectModel) async{
     var dbClient = await db;
     await dbClient!.insert("tblProject",projectModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
     return projectModel;
  }


  Future<QAlevel1Model> insertLevel1(QAlevel1Model model) async{
    var dbClient = await db;
    await dbClient!.insert("tblLevel1",model.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return model;
  }

  Future<Level2Model> insertLevel2(Level2Model model2) async{
    var dbClient = await db;
    await dbClient!.insert("tblLevel2",model2.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return model2;
  }

  Future<Level3Model>  insertLevel3(Level3Model model3) async{
    var dbClient = await db;
    await dbClient!.insert("tblLevel3",model3.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return model3;
  }
  
  Future<Level4Model> insertLevel4(Level4Model model4) async{
    var dbClient = await db;
    await dbClient!.insert("tblLevel4", model4.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return model4;
  }

  Future<Level5Model> insertLevel5(Level5Model model5) async{
    var dbClient = await db;
    await dbClient!.insert('tblLevel5', model5.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return model5;
  }

  Future<Level6Model> insertLevel6(Level6Model model6) async{
    var dbClient = await db;
    await dbClient!.insert('tblLevel6', model6.toMap(), conflictAlgorithm:  ConflictAlgorithm.replace);
    return model6;
  }


  Future<int> update(ProjectModel, projectModel)async{
    var dbClient = await db;
    return await dbClient!.update('tblProject',
    projectModel.toMap(),
      where: 'PID = ?',
      whereArgs: [projectModel.PID]
    );
  }

 Future<int> delete(int pid)async{
    var dbClient = await db;
    return await dbClient!.delete('tblProject',
    where: 'PID = ?',
    whereArgs: [pid]
    );
 }


 Future<UserMappingModel> insertUserMapping(UserMappingModel userMappingModel) async{
    var dbClient = await db;
    await dbClient!.insert('tblUserMapping', userMappingModel.toMap());
    return userMappingModel;
 }

 Future<UserModel> inserttblUsers(UserModel userModel) async{
    var dbClient = await db;
    await dbClient!.insert('tblUsers',userModel.toMap());
    return userModel;
 }

  Future<List<ProjectModel>> getProjects() async {   //to get project list
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblProject');

    // Convert the List<Map<String, dynamic>> to a List<ProjectModel>
    return List.generate(maps.length, (index) {
      return ProjectModel(
        PID: maps[index]['PID'],
        ProjectCode: maps[index]['ProjectCode'],
        ProjectName: maps[index]['ProjectName'],
        ProjectDescription: maps[index]['ProjectDescription'],
        Status: maps[index]['Status'],

      );
    });
  }


    Future<List<UserMappingModel>> getUserMappingOnPID(int pId) async {  //for opening data of same 'PrjID'
        var dbClient = await db;
        List<Map<String, dynamic>> maps = await dbClient!.query('tblUserMapping',
        where: "PrjID =?",
        whereArgs: [pId]
        );
          return List.generate(maps.length, (index) {
            return UserMappingModel(
              UID: maps[index]['UID'],
              PrjID: maps[index]['PrjID'],
              PrjAccess: maps[index]['PrjAccess'],
              QaAccess: maps[index]['QaAccess'],
              HseAccess: maps[index]['HseAccess'],
              SnagAccess: maps[index]['SnagAccess'],
              ObsAccess: maps[index]['ObsAccess'],
              BoqAccess: maps[index]['BoqAccess'],
              PmAccess: maps[index]['PmAccess'],
              MatAccess: maps[index]['MatAccess'],
              DlrAccess: maps[index]['DlrAccess'],
            );
          });
  }




  Future<List<UserMappingModel>> getUserMappingAll() async { //inserting data
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblUserMapping',);
    return List.generate(maps.length, (index) {
      return UserMappingModel(
        UID: maps[index]['UID'],
        PrjID: maps[index]['PrjID'],
        PrjAccess: maps[index]['PrjAccess'],
        QaAccess: maps[index]['QaAccess'],
        HseAccess: maps[index]['HseAccess'],
        SnagAccess: maps[index]['SnagAccess'],
        ObsAccess: maps[index]['ObsAccess'],
        BoqAccess: maps[index]['BoqAccess'],
        PmAccess: maps[index]['PmAccess'],
        MatAccess: maps[index]['MatAccess'],
        DlrAccess: maps[index]['DlrAccess'],
      );
    });
  }



  Future<List<UserModel>> getUserData() async{
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblUsers');
    return List.generate(maps.length, (index) {
      return UserModel(
          CompanyID: maps[index]['CompanyID'],
          uid: maps[index]['uid'],
          LoginName: maps[index]['LoginName'],
          Password: maps[index]['Password'],
          FirstName: maps[index]['FirstName'],
          LastName: maps[index]['LastName'],
          AccessRights: maps[index]['AccessRights'],
          Designation: maps[index]['Designation'],
          PAssigned: maps[index]['PAssigned'],
          Active: maps[index]['Active']
      );
    });
  }

  Future<List<UserModel>> getUIDmappingBasedUsers(int uid) async{
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblUsers',
    where: "uid =?",  whereArgs: [uid] );
    return List.generate(maps.length, (index) {
         //it will return uers table based on UID of tblUserMapping
      return UserModel(
          CompanyID: maps[index]['CompanyID'],
          uid: maps[index]['uid'],
          LoginName: maps[index]['LoginName'],
          Password: maps[index]['Password'],
          FirstName: maps[index]['FirstName'],
          LastName: maps[index]['LastName'],
          AccessRights: maps[index]['AccessRights'],
          Designation: maps[index]['Designation'],
          PAssigned: maps[index]['PAssigned'],
          Active: maps[index]['Active']
      );
    });
  }

  Future<List<QAlevel1Model>> getlevel1data() async{
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblLevel1',
    );
    return List.generate(maps.length, (index) {
      return QAlevel1Model(
          level1ID: maps[index]['level1ID'],
          pid: maps[index]['pid'],
          level1Name: maps[index]['level1Name']
      );
    });
  }


  Future<List<Level2Model>> getLevel2Data() async{
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblLevel2',
    );
    return List.generate(maps.length, (index) {
      return Level2Model(
          level2ID: maps[index]['level2ID'],
          level1ID: maps[index]['level1ID'],
          level2Name: maps[index]['level2Name'],
          Active: maps[index]['Active']
      );
    });
  }


  Future<List<Level3Model>> getLevel3DModel() async{
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblLevel3');
    return List.generate(maps.length, (index) {
      return Level3Model(
          level2ID: maps[index]['level2ID'],
          level3ID: maps[index]['level3ID'],
          level3Name: maps[index]['level3Name']
      );
    });
  }


  Future<List<Level4Model>> getLevel4Model() async{
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblLevel4');
    return List.generate(maps.length, (index) {
      return Level4Model(
          level4ID: maps[index]['level4ID'],
          level3ID: maps[index]['level3ID'],
          level4Name: maps[index]['level4Name']
      );
    });
  }

  Future<List<Level5Model>> getLevel5Model() async{
    var dbClient = await db;
    List<Map<String, dynamic >> maps = await dbClient!.query('tblLevel5');
    return List.generate(maps.length, (index) {
      return Level5Model(
          level5ID: maps[index]['level5ID'],
          level4ID: maps[index]['level4ID'],
          level5Name: maps[index]['level5Name']
      );
    });
  }


  Future<List<Level6Model>> getLevel6Model() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblLevel6');
    return List.generate(maps.length, (index) {
      return Level6Model(
          level6ID: maps[index]['level6ID'],
          level5ID: maps[index]['level5ID'],
          level6Name: maps[index]['level6Name']);
    });
  }


  // Future<List<String>> fetchUsersDataOnUid(int Uid) async {
  //   var dbClient = await db;
  //
  //   // Fetch MainTable IDs from MappingTable based on the provided value
  //   List<Map<String, dynamic>> mappingResults = await dbClient!.query(
  //     'tblUserMapping',
  //     where: 'UID = ?',
  //     whereArgs: [Uid],
  //   );
  //
  //
  //   return List.generate(mappingResults.length, (index) {
  //
  //   });
  // }



}