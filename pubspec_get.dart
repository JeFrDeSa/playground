import 'dart:io';

/// Updates all pubspec.yaml files of the flutter modules. Uses the
/// Flutter Version Manager (fvm) to execute the 'pub get' commands.
void main() async {
  final cwd = Directory.current;
  final directoryNames = await cwd.list().toList();

  print("Run 'fvm flutter pub get' for all flutter modules.");

  for (final FileSystemEntity directory in directoryNames) {
    _runPubGet(directory);
  }
}

// region Helper

/// Runs the 'pug get' command for every directory that contains a pubspec.yaml.
void _runPubGet(FileSystemEntity directory) async {
  if (await File("${directory.path}/pubspec.yaml").exists()) {
    final flutterModule = _determineFlutterModule(directory);

    Process.run(
      'fvm',
      ['flutter', 'pub', 'get', '--directory', flutterModule],
    ).then((result) {
      final ignoreCases = [
        "",
        "Waiting for another flutter command to release the startup lock...\n",
      ];

      if (!ignoreCases.contains(result.stdout)) print("${result.stdout}");
      if (!ignoreCases.contains(result.stderr)) print("${result.stderr}");
    });
  }
}

/// Determines the actual flutter module name.
/// For example: ./app
String _determineFlutterModule(FileSystemEntity directory) {
  String pathSeparator = Platform.pathSeparator;
  String directoryName = directory.path.split(Platform.pathSeparator).last;
  return ".$pathSeparator$directoryName";
}
// endregion
