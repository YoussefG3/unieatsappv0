import 'dart:io';

void main() {
  // Get all Dart files in the lib directory
  final directory = Directory('lib');
  final files = directory.listSync(recursive: true)
      .where((file) => file.path.endsWith('.dart'))
      .map((file) => file.path)
      .toList();

  for (final filePath in files) {
    final file = File(filePath);
    String content = file.readAsStringSync();
    
    // Replace package imports
    content = content.replaceAll(
      "import 'package:unieats/",
      "import 'package:unieatsappv0/"
    );
    
    // Save the file
    file.writeAsStringSync(content);
    print('Updated imports in $filePath');
  }
  
  print('All imports updated!');
}