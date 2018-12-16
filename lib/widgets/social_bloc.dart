import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_app/src/services/auth_service.dart';

class SocialBloc extends BlocBase {
  final AuthService _authService = AuthService();

  var _controllerLoading = BehaviorSubject<bool>(seedValue: false);

  Observable<bool> get outLoading => _controllerLoading.stream;

  final _phoneController = BehaviorSubject<String>();
  Observable<String> get phoneFlux => _phoneController.stream;
  Sink<String> get phoneEvent => _phoneController.sink;

  final _smsController = BehaviorSubject<String>();
  Observable<String> get phoneSmsFlux => _smsController.stream;
  Sink<String> get smsEvent => _smsController.sink;

  Future<void> onClickPhone() async {

 _controllerLoading.add(true);

    await _authService.verifyPhoneNumber(_phoneController.value);

     _controllerLoading.add(false);
  }

  Future<void> onClickFacebook() async {
    _controllerLoading.add(true);

    await Future.delayed(Duration(seconds: 2));

    _controllerLoading.add(false);
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
    _phoneController.close();
    _smsController.close();
    
  }
}
