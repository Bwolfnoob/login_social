import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_app/widgets/social_bloc.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   var bloc = BlocProvider.of<SocialBloc>(context);

    return Container(
      width: 90,
      height: 300,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed:bloc.onClickGoogle,
              child: Icon(FontAwesomeIcons.googlePlusG),
              backgroundColor: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: bloc.onClickFacebook,
              child: Icon(FontAwesomeIcons.facebookF),
              backgroundColor: Colors.blueAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: bloc.onClickTwitter,
              child: Icon(FontAwesomeIcons.twitter),
              backgroundColor: Colors.lightBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: bloc.onClickPhone,
              child: Icon(FontAwesomeIcons.phone),
              backgroundColor: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}