String? validateUsername(String? userInput) {
  if (userInput == null || userInput.length < 3) {
    return "Name muss mind. 3 Zeichen enthalten";
  }
  if (userInput.length >= 21) {
    return "Name darf max. 20 Zeichen lang sein";
  }
  if (userInput.contains(" ")) {
    return "Name darf keine Leerzeichen enthalten";
  }

  String abc = "abcdefghijklmnopqrstuvw";
  String abcUpper = abc.toUpperCase();
  String abcLowerUpppr = abc + abcUpper;

  if (!abcLowerUpppr.contains(userInput[0])) {
    return "Name muss mit einem Buchstaben beginnen";
  }

  return null;
}
// _________________________________________________________________

String? validateEmail(String? userInput) {
  if (userInput == null || !userInput.contains("@")) {
    return "Fehlerhafte Mailadresse. Bitte überprüfen";
  }
  if (userInput.contains("www.")) {
    return "Fehlerhafte URL";
  }

  String umlauts = "äüöÄÜÖß";
  for (var i = 0; i < userInput.length; i++) {
    final String umlaut = userInput[i];
    if (umlauts.contains(umlaut)) {
      return "keine Umlaute";
    }
  }

  return null;
}
// _________________________________________________________________________

String? validatePassword(String? userInput) {
  if (userInput == null || userInput.isEmpty) {
    return "Passwort darf nicht leer sein";
  }

//
//

// Wieso geht das kopierte aus GPT und meins nicht?

  bool hasDigit = false;
  for (var i = 0; i < userInput.length; i++) {
    if (userInput.codeUnitAt(i) >= 48 && userInput.codeUnitAt(i) <= 57) {
      hasDigit = true;
      break;
    }
  }
  if (!hasDigit) {
    return "Passwort muss mind. eine Zahl enthalten";
  }

  // bool hasFound = false;

  // for (var i = 0; i < userInput.length; i++) {
  //   if (userInput.codeUnitAt(i) >= 48 && userInput.codeUnitAt(i) <= 57) {
  //     hasFound = true;
  //     break;
  //   }

  //   if (!hasFound) {
  //     return "Passwort muss mind. eine Zahl enthalten";
  //   }
  // }
//

  if (userInput.length < 12 || userInput.length > 160) {
    return "Passwort muss mind. 12 Zeichen haben (max. 160)";
  }

//
//
  bool hasUpper = false;
  bool hasLower = false;

  for (var i = 0; i < userInput.length; i++) {
    String char = userInput[i];

    if (char.toUpperCase() == char && char.toLowerCase() != char) {
      hasUpper = true;
    }
    if (char.toLowerCase() == char && char.toUpperCase() != char) {
      hasLower = true;
    }
  }
  if (!hasUpper) return "Passwort mind. einen Großbuchstaben enthalten";
  if (!hasLower) return "Passwort mind. einen Kleinbuchstaben enthalten";

//
//

  if (userInput.contains(" ")) {
    return "Passwort darf keine Leerzeichen enthalten";
  }

  return null;

  //
}
