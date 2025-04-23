import 'package:cloud_firestore/cloud_firestore.dart' as firebase_store;
import 'package:firebase_messaging/firebase_messaging.dart'
    as firebase_messaging;

class Firebase {
  static Firebase? _instance;
  late firebase_store.FirebaseFirestore _store;
  late firebase_messaging.FirebaseMessaging _messaging;

  Firebase._internal() {
    _store = firebase_store.FirebaseFirestore.instance;
    _messaging = firebase_messaging.FirebaseMessaging.instance;
  }

  factory Firebase() {
    return _instance ??= Firebase._internal();
  }
  firebase_store.FirebaseFirestore get store => _store;
  firebase_messaging.FirebaseMessaging get messaging => _messaging;
}
