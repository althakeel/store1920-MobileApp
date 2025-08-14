bool isStringValid(String s, {bool removeWhitespaces = false}) {
  if (removeWhitespaces) {
    s = s.trim();
  }
  return s.isNotEmpty;
}

bool isValidNumber(String s) {
  return isStringValid(s) && RegExp('^([0-9])').hasMatch(s);
}

int? asInt(dynamic data, {int? defaultReturnValue}) {
  try {
    if (data == null) {
      return defaultReturnValue;
    }

    if (data is int) {
      return (data);
    }

    if (data is double) {
      return (data).toInt();
    }

    if (data is String) {
      return int.parse(data);
    }

    return defaultReturnValue;
  } catch (error) {
    return defaultReturnValue;
  }
}

extension StringExtension on String {
  getInitials() {
    if (isEmpty) {
      return '';
    }
    List<String> parts = split(' ');
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }
    return parts[0].substring(0, 1).toUpperCase() + 'J'.toUpperCase();
  }
}
