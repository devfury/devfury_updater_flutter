library devfury_updater_flutter;

import 'dart:convert';
import 'dart:io';

class DevfuryUpdater {
  static void update(
    String url,
    String processName, {
    String title = "DevFuryUpdater",
    String path = ".",
    bool isAdmin = false,
  }) async {
    final commandArguments = Platform.executableArguments.join(' ');

    try {
      Process.run(
        'DevFuryUpdate',
        [
          '-t',
          title,
          '-o',
          path,
          '-p',
          processName,
          '-c',
          base64Encode(utf8.encode('$processName $commandArguments')),
          url,
        ],
      );
    } catch (_) {
    } finally {
      Future.delayed(const Duration(seconds: 1)).then((_) => exit(0));
    }
  }
}
