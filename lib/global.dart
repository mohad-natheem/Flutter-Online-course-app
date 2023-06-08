import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/common/routes/bloc_observer.dart';
import 'package:online_learning_app/common/services/storage_service.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyGlobalObserver();
  await Firebase.initializeApp();

  storageService = await StorageService().init();
    
  }
}