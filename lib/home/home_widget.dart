import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/widgets/social_bloc.dart';
import 'package:simple_app/widgets/social_widget.dart';

class HomeWidget extends StatelessWidget {
  final String title;

  HomeWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blocSocial = BlocProvider.of<SocialBloc>(context);

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset("assets/background_4k.jpg" , height: double.infinity,fit: BoxFit.fitHeight),
        ),
        Scaffold(
              backgroundColor: Colors.transparent,
            // appBar: AppBar(
            //   title: Text(title),
            // ),
            body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: Icon(Icons.local_gas_station,
                            color: Colors.white, size: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff555555),
                                offset: new Offset(2.0, 2.0),
                                blurRadius: 10),
                          ],
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SocialWidget(),
                    StreamBuilder<bool>(
                      stream: blocSocial.outLoading,
                      builder: (_, snapShot) {
                        return AnimatedCrossFade(
                          firstChild: Card(
                            color: Color(0xffbbFFFFFF),
                            child: Container(
                              width: 300,
                              height: 230,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'email@exemplo.com',
                                            labelText: 'Email'),
                                        // The validator receives the text the user has typed in
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Entre com seu email';
                                          }
                                        },
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            hintText: '*****',
                                            labelText: 'Senha'),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Entre com sua senha';
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: RaisedButton(
                                          padding: EdgeInsets.only(
                                              left: 100, right: 100),
                                          onPressed: () {},
                                          color: Colors.blueAccent,
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    26 / 1.5),
                                          ),
                                          child: Text(
                                            "Entrar",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          secondChild: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: 300,
                              height: 230,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                ],
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 500),
                          crossFadeState: snapShot.data
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
