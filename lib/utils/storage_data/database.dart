import 'dart:async';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class SQLdb {
  // DatabaseHelper._privateConstructor();
  //static final DatabaseHelper instance= DatabaseHelper._privateConstructor();

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initiateDB();
      return _db;
    } else {
      return _db;
    }
  }

  initiateDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, 'zifatura983.db');
    Database mydb = await openDatabase(path,
        version: 12, onCreate: _onCreate, onUpgrade: _onUpgreade);
    return mydb;
  }

  _onUpgreade(Database db, int oldversion, int newversion) {

    print("onupgrag=======================================");
  }

  _onCreate(Database db, int version) async {
   

 await   db.execute('''
CREATE TABLE "album" (
  "AlbumId" int(11) NOT NULL PRIMARY KEY,
  "Title" varchar(160) NOT NULL,
  "ArtistId" int(11) NOT NULL,
   FOREIGN KEY (ArtistId) REFERENCES artist(ArtistId)
)
      ''');
   await db.execute('''
CREATE TABLE "artist" (
  "ArtistId" int(11) NOT NULL PRIMARY KEY,
  "Name" varchar(120) DEFAULT NULL
)
      ''');
   
   await db.execute('''
 CREATE TABLE "customer" (
  "CustomerId" int(11) NOT NULL,
  "FirstName" varchar(40) NOT NULL,
  "LastName" varchar(20) NOT NULL,
  "Company" varchar(80) DEFAULT NULL,
  "Address" varchar(70) DEFAULT NULL,
  "City" varchar(40) DEFAULT NULL,
  "State" varchar(40) DEFAULT NULL,
  "Country" varchar(40) DEFAULT NULL,
  "PostalCode" varchar(10) DEFAULT NULL,
  "Phone" varchar(24) DEFAULT NULL,
  "Fax" varchar(24) DEFAULT NULL,
  "Email" varchar(60) NOT NULL,
  "SupportRepId" int(11) DEFAULT NULL
)
      ''');
   await db.execute('''
CREATE TABLE "employee" (
  "EmployeeId" int(11) NOT NULL,
  "LastName" varchar(20) NOT NULL,
  "FirstName" varchar(20) NOT NULL,
  "Title" varchar(30) DEFAULT NULL,
  "ReportsTo" int(11) DEFAULT NULL,
  "BirthDate" datetime DEFAULT NULL,
  "HireDate" datetime DEFAULT NULL,
  "Address" varchar(70) DEFAULT NULL,
  "City" varchar(40) DEFAULT NULL,
  "State" varchar(40) DEFAULT NULL,
  "Country" varchar(40) DEFAULT NULL,
  "PostalCode" varchar(10) DEFAULT NULL,
  "Phone" varchar(24) DEFAULT NULL,
  "Fax" varchar(24) DEFAULT NULL,
  "Email" varchar(60) DEFAULT NULL
)
      ''');
    await db.execute('''
CREATE TABLE "genre" (
  "GenreId" int(11) NOT NULL,
  "Name" varchar(120) DEFAULT NULL
)
      ''');
    await  db.execute('''
CREATE TABLE "invoice" (
  "InvoiceId" int(11) NOT NULL,
  "CustomerId" int(11) NOT NULL,
  "InvoiceDate" datetime NOT NULL,
  "BillingAddress" varchar(70) DEFAULT NULL,
  "BillingCity" varchar(40) DEFAULT NULL,
  "BillingState" varchar(40) DEFAULT NULL,
  "BillingCountry" varchar(40) DEFAULT NULL,
  "BillingPostalCode" varchar(10) DEFAULT NULL,
  "Total" decimal(10,2) NOT NULL
)
      ''');
   await db.execute('''
CREATE TABLE "invoiceline" (
  "InvoiceLineId" int(11) NOT NULL,
  "InvoiceId" int(11) NOT NULL,
  "TrackId" int(11) NOT NULL,
  "UnitPrice" decimal(10,2) NOT NULL,
  "Quantity" int(11) NOT NULL
)
      ''');
   await db.execute('''
CREATE TABLE "mediatype" (
  "MediaTypeId" int(11) NOT NULL,
  "Name" varchar(120) DEFAULT NULL
)
      ''');
  await  db.execute('''
CREATE TABLE "playlist" (
  "PlaylistId" int(11) NOT NULL,
  "Name" varchar(120) DEFAULT NULL
)
      ''');
  await  db.execute('''
CREATE TABLE "playlisttrack" (
  "PlaylistId" int(11) NOT NULL,
  "TrackId" int(11) NOT NULL
)
      ''');
 await   db.execute('''
CREATE TABLE "track" (
  "TrackId" int(11) NOT NULL,
  "Name" varchar(200) NOT NULL,
  "AlbumId" int(11) DEFAULT NULL,
  "MediaTypeId" int(11) NOT NULL,
  "GenreId" int(11) DEFAULT NULL,
  "Composer" varchar(220) DEFAULT NULL,
  "Milliseconds" int(11) NOT NULL,
  "Bytes" int(11) DEFAULT NULL,
  "UnitPrice" decimal(10,2) NOT NULL
)
      ''');
 /*  await db.execute('''
ALTER TABLE "album"
  ADD PRIMARY KEY ("AlbumId"),
  ADD KEY "ArtistId" ("ArtistId");
      ''');
   await db.execute('''
ALTER TABLE "artist"
  ADD PRIMARY KEY ("ArtistId");
      ''');
   await db.execute('''
ALTER TABLE "customer"
  ADD PRIMARY KEY ("CustomerId"),
  ADD KEY "SupportRepId" ("SupportRepId");
      ''');
   await db.execute('''
ALTER TABLE "employee"
  ADD PRIMARY KEY ("EmployeeId"),
  ADD KEY "ReportsTo" ("ReportsTo");
      ''');
   await db.execute('''
ALTER TABLE "genre"
  ADD PRIMARY KEY ("GenreId");
      ''');
   await db.execute('''
ALTER TABLE "invoice"
  ADD PRIMARY KEY ("InvoiceId"),
  ADD KEY "CustomerId" ("CustomerId");
      ''');
  await  db.execute('''
ALTER TABLE "invoiceline"
  ADD PRIMARY KEY ("InvoiceLineId"),
  ADD KEY "InvoiceId" ("InvoiceId"),
  ADD KEY "TrackId" ("TrackId");
      ''');
   await db.execute('''
ALTER TABLE "mediatype"
  ADD PRIMARY KEY ("MediaTypeId");
      ''');
   await db.execute('''
ALTER TABLE "playlist"
  ADD PRIMARY KEY ("PlaylistId");
      ''');
  await  db.execute('''
ALTER TABLE "playlisttrack"
  ADD PRIMARY KEY ("PlaylistId","TrackId"),
  ADD KEY "TrackId" ("TrackId");
      ''');
  await  db.execute('''
ALTER TABLE "track"
  ADD PRIMARY KEY ("TrackId"),
  ADD KEY "AlbumId" ("AlbumId"),
  ADD KEY "GenreId" ("GenreId"),
  ADD KEY "MediaTypeId" ("MediaTypeId");
      ''');
await db.execute('''
ALTER TABLE "album"
  ADD CONSTRAINT "album_ibfk_1" FOREIGN KEY ("ArtistId") REFERENCES "artist" ("ArtistId") ON DELETE NO ACTION ON UPDATE NO ACTION;

''');
await db.execute('''
ALTER TABLE "customer"
  ADD CONSTRAINT "customer_ibfk_1" FOREIGN KEY ("SupportRepId") REFERENCES "employee" ("EmployeeId") ON DELETE NO ACTION ON UPDATE NO ACTION;

''');
await db.execute('''
ALTER TABLE "employee"
  ADD CONSTRAINT "employee_ibfk_1" FOREIGN KEY ("ReportsTo") REFERENCES "employee" ("EmployeeId") ON DELETE NO ACTION ON UPDATE NO ACTION;

''');
await db.execute('''
ALTER TABLE "invoice"
  ADD CONSTRAINT "invoice_ibfk_1" FOREIGN KEY ("CustomerId") REFERENCES "customer" ("CustomerId") ON DELETE NO ACTION ON UPDATE NO ACTION;

''');
await db.execute('''
ALTER TABLE "invoiceline"
  ADD CONSTRAINT "invoiceline_ibfk_1" FOREIGN KEY ("InvoiceId") REFERENCES "invoice" ("InvoiceId") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "invoiceline_ibfk_2" FOREIGN KEY ("TrackId") REFERENCES "track" ("TrackId") ON DELETE NO ACTION ON UPDATE NO ACTION;

''');
await db.execute('''
ALTER TABLE "playlisttrack"
  ADD CONSTRAINT "playlisttrack_ibfk_1" FOREIGN KEY ("PlaylistId") REFERENCES "playlist" ("PlaylistId") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "playlisttrack_ibfk_2" FOREIGN KEY ("TrackId") REFERENCES "track" ("TrackId") ON DELETE NO ACTION ON UPDATE NO ACTION;

''');
await db.execute('''
ALTER TABLE "track"
  ADD CONSTRAINT "track_ibfk_1" FOREIGN KEY ("AlbumId") REFERENCES "album" ("AlbumId") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "track_ibfk_2" FOREIGN KEY ("GenreId") REFERENCES "genre" ("GenreId") ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT "track_ibfk_3" FOREIGN KEY ("MediaTypeId") REFERENCES "mediatype" ("MediaTypeId") ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

''');*/

    print("gggggg");
  }
 //read data
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
  // Add data
  insertData(String sql) async {
    Database? mydb =await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  // Delete Note
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

 

  // Update Note
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
}
