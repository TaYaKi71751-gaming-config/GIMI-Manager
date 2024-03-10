import 'dart:io';

class Mod {
  String? path;
  Mod(String this.path);

  bool get status {
    for (FileSystemEntity entity in Directory(this.path!).listSync()) {
      if (File(entity.path).existsSync()) {
        if (entity.path.endsWith('.ini.disabled')) {
          return false;
        }
      }
    }
    for (FileSystemEntity entity in Directory(this.path!).listSync()) {
      if (File(entity.path).existsSync()) {
        if (entity.path.endsWith('.ini')) {
          return true;
        }
      }
    }
    return false;
  }

  set status(bool stat) {
    String? from, to;
    if (stat == true) {
      from = '.ini.disabled';
      to = '.ini';
    } else if (stat == false) {
      from = '.ini';
      to = '.ini.disabled';
    }
    for (FileSystemEntity entity in Directory(path!).listSync()) {
      if (File(entity.path).existsSync()) {
        if (entity.path.endsWith(to!)) {
          continue;
        } else if (entity.path.endsWith(from!)) {
          File(entity.path).renameSync(
              entity.path.substring(0, entity.path.length - from.length) + to);
        }
      }
    }
  }

  get isMod {
    for (FileSystemEntity entity in Directory(this.path!).listSync()) {
      if (File(entity.path).existsSync()) {
        if (entity.path.endsWith('.ini.disabled')) {
          return true;
        }
        if (entity.path.endsWith('.ini')) {
          return true;
        }
      }
    }
    return false;
  }
}
