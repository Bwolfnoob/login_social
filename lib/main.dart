import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/app_bloc.dart';
import 'package:simple_app/home/home_widget.dart';
import 'package:simple_app/widgets/social_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
        bloc: AppBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            accentColor: Colors.blue,
            primaryColor: Colors.red,
            primarySwatch: Colors.red,
          ),
          home: BlocProvider<SocialBloc>(
            bloc: SocialBloc(),
            child: HomeWidget(title: 'Login Sample'),
          )
        ));
  }
}


