import 'dart:io';

import 'package:gimimanager/util/mod/Mod.dart';

class ModList {
  static List<Mod> get all {
    List<Mod> rtn = List.empty(growable: true);
    for (FileSystemEntity entity in Directory.current.listSync()) {
      if (File(entity.path).existsSync()) {
        continue;
      }
      if (Directory(entity.path).existsSync()) {
        var m = Mod(entity.path);
        if (m.isMod) {
          rtn.add(m);
        }
      }
    }
    return rtn;
  }
}
