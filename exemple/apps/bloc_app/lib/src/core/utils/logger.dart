import 'package:logger/logger.dart' show Level, Logger;

class L {
  static void log(dynamic msg) {
    final Logger logger = Logger();
    logger.log(Level.debug, msg);
  }
}
