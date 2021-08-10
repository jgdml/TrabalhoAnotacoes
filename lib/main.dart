import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:text_editor/app/inject.dart';

import 'app/app.dart';

Future<void> main() async {
    
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    setupInject();
    
    runApp(App());
}
