import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../model/aspects.dart';
import '../model/mindset.dart';
import '../model/tactics.dart';

class DBHelper{
  static final DBHelper _instance = DBHelper._();
  static Database? _db;
  DBHelper._();
  factory DBHelper() {
    return _instance;
  }
  Future<Database?> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ai4one.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
     saveAspects();

     saveMindsets();
     saveTactics();
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
    "CREATE TABLE aspects(id INTEGER PRIMARY KEY, name TEXT, question TEXT, audioFilename TEXT,value INTEGER ,image TEXT )");
    print("Created aspect table");
    await db.execute(
        "CREATE TABLE mindsets(id INTEGER PRIMARY KEY, name TEXT, question TEXT, audioFilename TEXT,value INTEGER ,image TEXT )");
    print("Created mindsets table");
    await db.execute(
        "CREATE TABLE tactics(id INTEGER PRIMARY KEY, name TEXT, question TEXT, audioFilename TEXT,value INTEGER ,image TEXT )");
    print("Created tactics table");

  }
  
  // Retrieving employees from Employee Tables
  Future<List<Aspects>> getAspects() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM aspects');
    List<Aspects> aspect = <Aspects>[];
    for (int i = 0; i < list.length; i++) {
      aspect.add(new Aspects(list[i]["name"], list[i]["question"], list[i]["audioFilename"], list[i]["value"],list[i]["image"]));
    }
    print(aspect.length);
    return aspect;
  }
  Future<List<Mindsets>> getMindsets() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM mindsets');
    List<Mindsets> mindset = <Mindsets>[];
    for (int i = 0; i < list.length; i++) {
      mindset.add(new Mindsets(list[i]["name"], list[i]["question"], list[i]["audioFilename"], list[i]["value"],list[i]["image"]));
    }
    print(mindset.length);
    return mindset;
  }
  Future<List<Tactics>> getTactics() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM tactics');
    List<Tactics> tactic = <Tactics>[];
    for (int i = 0; i < list.length; i++) {
      tactic.add(new Tactics(list[i]["name"], list[i]["question"], list[i]["audioFilename"], list[i]["value"],list[i]["image"]));
    }
    print(tactic.length);
    return tactic;
  }

  void saveAspects() async {
    List<Aspects> asp = <Aspects>[
      Aspects ( "Health", "How important is maintaining your health? ", " 01C  ", " i1 ",0) ,
      Aspects ( "Property", "How significant is managing your finances to you? ", " 02C  ", " i2 ",0) ,
      Aspects ( "Home", "How crucial is creating a home in your life? ", " 03C  ", " i3 ",0) ,
      Aspects ( "Career", "How much does finding your career matter to you? ", " 04C  ", " i4 ",0) ,
      Aspects ( " Children   ", "How important is raising a family to you? ", " 05C  ", " i5 ",0) ,
      Aspects ( " Sex   ", "How significant is maintaining your sex life? ", " 06C  ", " i6 ",0) ,
      Aspects ( " Food & Drink   ", "How crucial is food enjoyment in your life? ", " 07C  ", " i7 ",0) ,
      Aspects ( " Love   ", "How much does seeking love matter to you? ", " 08C  ", " i8 ",0) ,
      Aspects ( " Family   ", "How important is spending time with your family? ", " 09C  ", " i9 ",0) ,
      Aspects ( " Friends   ", "How significant is being there for friends to you? ", " 10C  ", " i10 ",0) ,
      Aspects ( " Politics   ", "How crucial is getting socially involved in your life? ", " 11C  ", " i11 ",0) ,
      Aspects ( " People   ", "How much does networking matter to you? ", " 12C  ", " i12 ",0) ,
      Aspects ( " Animals   ", "How important is caring for animals to you? ", " 13C  ", " i13 ",0) ,
      Aspects ( " Nature   ", "How significant is experiencing nature? ", " 14C  ", " i14 ",0) ,
      Aspects ( " Energy   ", "How crucial is managing your energy in your life? ", " 15C  ", " i15 ",0) ,
      Aspects ( " Time   ", "How much does valuing your time matter to you? ", " 16C  ", " i16 ",0) ,
      Aspects ( " Art   ", "How important is expressing creativity to you? ", " 17C  ", " i17 ",0) ,
      Aspects ( " Religion   ", "How significant is practicing your beliefs? ", " 18C  ", " i18 ",0) ,
      Aspects ( " Soul   ", "How crucial is exploring spirituality in your life? ", " 19C  ", " i19 ",0) ,
      Aspects ( " Integrity   ", "How much does staying true to yourself matter to you? ", " 20C  ", " i20 ",0) ,
    ];

    var dbClient = await db;
    for(int i=0;i<20;i++) {
      await dbClient!.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO aspects(name, question, audioFilename,  value,image) VALUES("${asp[i]
                .name}", "${asp[i].question}","${asp[i].audioFilename}", "${asp[i]
                .value}","${asp[i].image}")');
      });
    }
  }
  void saveMindsets() async {
    List<Mindsets> mind = <Mindsets>[
      Mindsets("Knowing","Do you seek knowledge to understand different viewpoints?","41C","i41",0),
      Mindsets("Curiosity","How often do you embrace curiosity?","42C","i42",0),
      Mindsets("Desire","How frequently do you pursue your desires?","43C","i43",0),
      Mindsets("Need","How often do you recognize your needs?","44C","i44",0),
      Mindsets("Demand","How frequently do you assert your demands?","45C","i45",0),
      Mindsets("Enforcement","How often do you enforce your beliefs and values?","46C","i46",0),
      Mindsets("Inhibition","Do you find yourself inhibiting your actions?","47C","i47",0),
      Mindsets("Abscence","How frequently do you feel a sense of absence?","48C","i48",0),
      Mindsets("Refusal","How often do you refuse certain situations or ideas?","49C","i49",0),
      Mindsets("Denial","How frequently do you engage in denial about life or self?","50C","i50",0),
];

    var dbClient = await db;
    for(int i=0;i<20;i++) {
      await dbClient!.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO mindsets(name, question, audioFilename, value ,image) VALUES("${mind[i]
                .name}", "${mind[i].question}","${mind[i].audioFilename}", "${mind[i]
                .value}","${mind[i].image}")');
      });
    }
  }
  void saveTactics( ) async {
    List<Tactics> tac = <Tactics>[
    Tactics("Help" ,"Do you help resolve issues?" ,"21C" ,"i21",0),
    Tactics("Control" ,"In trouble, do you take control?" ,"22C" ,"i22",0),
    Tactics("Communication" ,"Do you communicate under pressure?" ,"23C" ,"i23",0),
    Tactics("Understanding" ,"Do you seek understanding in conflict?" ,"24C" ,"i24",0),
    Tactics("Agreement" ,"In disagreement, do you agree to move forward?" ,"25C" ,"i25",0),
    Tactics("Empathy" ,"Do you empathize in difficult situations?" ,"26C" ,"i26",0),
    Tactics("Persistance " ,"Do you persist through troubles?" ,"27C" ,"i27",0),
    Tactics("Acceptance" ,"Do you accept the reality of issues?" ,"28C" ,"i28",0),
    Tactics("Creation " ,"Do you create solutions to problems?" ,"29C" ,"i29",0),
    Tactics("Honesty" ,"In conflicts, do you remain honest?" ,"30C" ,"i30",0),
    Tactics("Improvement" ,"Do you strive for improvement in difficult times?" ,"31C" ,"i31",0),
    Tactics("Change" ,"When faced with problems, do you change?" ,"32C" ,"i32",0),
    Tactics("Attack" ,"Do you confront issues directly?" ,"33C" ,"i33",0),
    Tactics("Criticism" ,"Do you criticize others when faced with problems?" ,"34C" ,"i34",0),
    Tactics("Manipulation" ,"Do you manipulate others to solve issues?" ,"35C" ,"i35",0),
    Tactics("Lie" ,"Do you lie to avoid issues?" ,"36C" ,"i36",0),
    Tactics("Disregard" ,"Do you disregard problems?" ,"37C" ,"i37",0),
    Tactics("Escape" ,"Do you seek escape when faced with problems?" ,"38C" ,"i38",0),
    Tactics("Surrender" ,"Do you surrender when encountering issues?" ,"39C" ,"i39",0),
    Tactics("Ending" ,"Do you seek to make problems end?" ,"40C" ,"i40",0),
];
    var dbClient = await db;
    for(int i=0;i<20;i++) {
      await dbClient!.transaction((txn) async {
        return await txn.rawInsert(
            'INSERT INTO tactics(name, question, audioFilename,  value,image) VALUES("${tac[i]
                .name}", "${tac[i].question}","${tac[i].audioFilename}", "${tac[i]
                .value}","${tac[i].image}")');
      });
    }
  }


}