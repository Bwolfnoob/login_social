import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  int i = 0;

  var _blocController = BehaviorSubject<int>(seedValue: 0);

  get increment => () {
        i = i + 1;
        _blocController.add(i);
      };

  @override
  void dispose() {
    _blocController.close();
  }
}
