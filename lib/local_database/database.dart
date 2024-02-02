
import 'dart:io'as io;
import 'package:path_provider/path_provider.dart';
import 'package:qcop/api_service/api_service.dart';
import 'package:qcop/local_database/models/project_models.dart';
import 'package:qcop/local_database/models/usermapping.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../api_service/response/project_list_response_model.dart';
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
         'CREATE TABLE tblUsers (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,uid LONG UNIQUE,LoginName TEXT NOT NULL,'
             'Password TEXT NOT NULL,FirstName TEXT'
             ',LastName TEXT,AccessRights TEXT,'
             'Designation TEXT,PAssigned TEXT,Active TEXT,CompanyID INTEGER)'
     );

     await db.execute('CREATE TABLE tblProject (PrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,PID INTEGER UNIQUE,ProjectCode TEXT,'
         'ProjectName TEXT NOT NULL,ProjectDescription TEXT,Status TEXT)'
     );
     await db.execute(
         'CREATE TABLE tblUserMapping (UID INTEGER,PrjID INTEGER,PrjAccess TEXT,QaAccess TEXT,HseAccess TEXT'
             ',SnagAccess TEXT,ObsAccess TEXT,BoqAccess TEXT,PmAccess TEXT,MatAccess TEXT,DlrAccess TEXT)');
     // await db.execute('INSERT INTO tblProject (ProjectName) VALUES ');
     //await db.execute("CREATE TABLE if not exists tblProject (id INTEGER PRIMARY KEY AUTOINCREMENT)");
  }

  Future<ProjectModel> insert(ProjectModel projectModel) async{
     var dbClient = await db;
     await dbClient!.insert("tblProject",projectModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
     return projectModel;
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

  Future<List<ProjectModel>> getProjects() async {
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


    Future<List<UserMappingModel>?> getUserMapping(int pId) async {
        var dbClient = await db;
        List<Map<String, dynamic>> maps = await dbClient!.query('tblUserMapping',
        where: "PrjID =?",
        whereArgs: [pId]
        );
        if(maps.isEmpty) {
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
        }else {
          return null;
        }
  }

     getUserModelData(int uid) async{
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient!.query('tblUsers',
    where: 'UID = ?',
      whereArgs:  [uid]
    );

  }





  void insertPidIntoUserMapping() async {
    var dbClient = await db;

    // Replace 'PID', 'tblProject', and 'tblUserMapping' with your actual column and table names
    await dbClient!.rawInsert(
        'INSERT INTO tblUserMapping (PID) SELECT PID FROM tblProject WHERE your_condition');

    print("Data inserted successfully");

  }




}