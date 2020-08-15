import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workout_app/app/pages/home/home_page.dart';
import 'package:workout_app/app/pages/login/login_page.dart';

import 'app_widget.dart';

class AppModule extends  MainModule {

  @override
  List<Bind> get binds => [
    
  ];

  @override
  List<Router> get routers => [
    Router('/',
        child: (_, args) => LoginPage(),
        transition: TransitionType.rightToLeftWithFade),
    Router('/home',
        child: (_, args) => HomePage(),
        transition: TransitionType.rightToLeftWithFade)
  ];

  @override
  Widget get bootstrap => AppWidget();

}
