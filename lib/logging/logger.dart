import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as system_log;
import 'package:lumberdash/lumberdash.dart';


void setupLogging() {
  putLumberdashToWork(withClients: [
    ColorizeLumberdash(),
  ]);
  system_log.Logger.root.level = system_log.Level.ALL;
  system_log.Logger.root.onRecord.listen((rec) {
      debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}