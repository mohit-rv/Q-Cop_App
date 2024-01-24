import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {

  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();       //created path
    return openDatabase(
      join(path, "qCop.db"),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE qa_module (id INTEGER PRIMARY KEY AUTOINCREMENT, select_location BOOL NOT NULL, select_category BOOL NOT NULL, connect_server BOOL NOT NULL, check_status BOOL NOT NULL)");
      },
      version: 1,
    );
  }

  Future<Database> insertQASelections(bool selectLocation, bool selectCategory, bool connectServer, bool checkStatus) async {
    final Database db = await initializedDB();

    await db.execute("INSERT INTO qa_module (select_location, select_category, connect_server, check_status) VALUES ($selectLocation, $selectCategory, $connectServer, $checkStatus)");

    return db;
  }

  Future<Database> updateQASelections(bool selectLocation, bool selectCategory, bool connectServer, bool checkStatus) async {
    final Database db = await initializedDB();

    await db.execute("UPDATE qa_module SET select_location = $selectLocation, select_category = $selectCategory, connect_server = $connectServer, check_status = $checkStatus WHERE id = 1");

    return db;
  }

  Future<List<Map<String, dynamic>>> getQASelections() async {
    final Database db = await initializedDB();
    List<Map<String, dynamic>> result = await db.query('qa_module');
    return result;
  }

  Future<Database> createLocationTable(int noOfField) async {

    final Database db = await initializedDB();

    await db.execute("CREATE TABLE if not exists qa_location (id INTEGER PRIMARY KEY AUTOINCREMENT)");

    for (var i = 0 ; i < noOfField; i++) {

      await db.execute("ALTER TABLE qa_location ADD location${i + 1} varchar(255)");

    }

    return db;
  }

  Future<Database> insertLocation(String location1, String location2, String location3, String location4, String location5) async {
    final Database db = await initializedDB();

    await db.rawInsert("INSERT INTO qa_location('location1', 'location2', 'location3', 'location4', 'location5') VALUES('$location1', '$location2', '$location3', '$location4', '$location5')");
    
    return db;
  }

  Future<List<Map<String, dynamic>>?> getLocations() async {
    final Database db = await initializedDB();

    try {
      List<Map<String, dynamic>> result = await db.query('qa_location');
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}