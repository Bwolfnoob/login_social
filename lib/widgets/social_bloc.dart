import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class SocialBloc extends BlocBase {
  var _controllerLoading = BehaviorSubject<bool>(seedValue: false);

  Observable<bool> get outLoading => _controllerLoading.stream;

  Future<void> onClickFacebook() async {
    _controllerLoading.add(true);

    print("IN2 ${_controllerLoading.value}");

    await Future.delayed(Duration(seconds: 2));

    _controllerLoading.add(false);

    print("OUT2 ${_controllerLoading.value}");
  }

  Future<void> onClickGoogle() async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> onClickTwitter() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controllerLoading.close();
  }
}
