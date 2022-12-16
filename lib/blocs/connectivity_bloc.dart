import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityBloc {
  late StreamController _connectivityController;
 StreamSink<ConnectivityResult> get connectivityResultSink =>
      _connectivityController.sink as StreamSink<ConnectivityResult>;
  Stream<ConnectivityResult> get connectivityResultStream =>
      _connectivityController.stream as Stream<ConnectivityResult>;

  ConnectivityBloc() {
    _connectivityController = StreamController<ConnectivityResult>.broadcast();
    checkCurrentConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityController.add(result);
    });
  }
  void checkCurrentConnectivity() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    _connectivityController.add(connectivityResult);
  }

  dispose() {
    _connectivityController.close();
  }
}
