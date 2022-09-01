import 'dart:io';

String getFileName(File? file) {
  if (file == null) return "";
  return (file.path.split('/').last);
}
