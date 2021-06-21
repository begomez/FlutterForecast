import 'package:date_format/date_format.dart';

abstract class AppDateUtils {
  static const int MILIS_PER_SEC = 1000;

  static int nowInMillis() => DateTime.now().millisecondsSinceEpoch;

  static int nowInSecs() => (nowInMillis() / MILIS_PER_SEC).toInt();

  static String millisToHH(int milis) {
    var format =[HH, ':', '00'];

    return formatDate(DateTime.fromMillisecondsSinceEpoch(milis), format);
  }
}