import 'package:cloud_firestore/cloud_firestore.dart' as firebase_store;
import 'package:firebase_messaging/firebase_messaging.dart'
    as firebase_messaging;
import 'package:firebase_database/firebase_database.dart' as firebase_database;

class Firebase {
  static Firebase? _instance;
  late firebase_store.FirebaseFirestore _store;
  late firebase_messaging.FirebaseMessaging _messaging;
  late firebase_database.FirebaseDatabase _database;

  Firebase._internal() {
    _store = firebase_store.FirebaseFirestore.instance;
    _messaging = firebase_messaging.FirebaseMessaging.instance;
    _database = firebase_database.FirebaseDatabase.instance;
  }

  factory Firebase() {
    return _instance ??= Firebase._internal();
  }
  firebase_store.FirebaseFirestore get store => _store;
  firebase_database.FirebaseDatabase get database => _database;
  firebase_messaging.FirebaseMessaging get messaging => _messaging;
}
