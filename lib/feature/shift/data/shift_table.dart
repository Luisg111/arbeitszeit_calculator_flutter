import "package:drift/drift.dart";

class ShiftTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get start => dateTime()();

  DateTimeColumn get end => dateTime()();

  IntColumn get breakTime => integer()();

  @override
  String get tableName => "shift";
}

/* Equal SQL statement with testing data
https://onecompiler.com/sqlite
  CREATE TABLE SHIFT (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  start INTEGER NOT NULL,
  end INTEGER NOT NULL,
  break_time INTEGER NOT NULL
);

INSERT INTO SHIFT (start,end,break_time) values (1744877670,1744877670+7200,3600);
INSERT INTO SHIFT (start,end,break_time) values (1744877670,1744877670+7200,3600);
INSERT INTO SHIFT (start,end,break_time) values (1744877670,1744877670+7200,3600);
INSERT INTO SHIFT (start,end,break_time) values (1744877670,1744877670+7200,3600);
 */