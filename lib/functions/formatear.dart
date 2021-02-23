import 'package:intl/intl.dart';

class Format {
  // Recibe un DateTime y retorna un String de hace cuanto fue o en cuánto será
  static String dateFormattedFromDateTime(DateTime dateTime) {
    Duration duration = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch));
    DateTime hoy = DateTime.now();
    String diaHoy = DateFormat.d('es').format(hoy);
    String dia = DateFormat.d('es').format(dateTime);
    String mes = DateFormat.M('es').format(dateTime);
    String mesHoy = DateFormat.M('en').format(hoy);
    String year = DateFormat.y('es').format(dateTime);
    String yearHoy = DateFormat.y('es').format(hoy);

    if (duration.inMinutes == 0) {
      return "Justo ahora";
    } else if (duration.inMinutes < 60 && duration.inMinutes > 0) {
      int mins = duration.inMinutes;
      return "Hace ${mins.floor()} ${mins.floor() == 1 ? "min" : "mins"}";
    } else if (duration.inHours <= 3 && duration.inMinutes > 0) {
      int horas = duration.inHours;
      return "Hace ${horas.floor()} ${horas.floor() == 1 ? "hora" : "horas"}";
    } else if (diaHoy == dia &&
        mesHoy == mes &&
        yearHoy == year &&
        duration.inMinutes > 0) {
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      return "Hoy, $horaFormatted";
    } else if (((int.parse(diaHoy) - 1 == (int.parse(dia))) ||
            (int.parse(diaHoy) == (int.parse(dia) - 30)) ||
            (int.parse(diaHoy) == (int.parse(dia) - 29))) &&
        duration.inDays < 2 &&
        duration.inDays >= 0) {
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      return "Ayer, $horaFormatted ";
    } else if (duration.inDays >= 2 &&
        duration.inDays < 7 &&
        duration.inMinutes > 0) {
      String fechaFormatted = DateFormat.EEEE('es').format(dateTime);
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      String diaFormatted = DateFormat.d('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      fechaFormatted = fechaFormatted.replaceAll('.', '');
      String mayusc = fechaFormatted.toUpperCase().substring(0, 1);
      fechaFormatted = fechaFormatted.replaceRange(0, 1, mayusc);
      return "$fechaFormatted $diaFormatted, $horaFormatted ";
    } else if (duration.inHours / 24 < 30 && duration.inMinutes > 0) {
      double dias = duration.inHours / 24;
      return "Hace ${dias.floor()} ${dias.floor() == 1 ? "día" : "días"}";
    } else if (duration.inHours / (24 * 30) < 12 && duration.inMinutes > 0) {
      double meses = duration.inHours / (24 * 30);
      return "Hace ${meses.floor()} ${meses.floor() == 1 ? "mes" : "meses"}";
    } else if (duration.inDays > 365 && duration.inMinutes > 0) {
      double years = duration.inHours / (24 * 30 * 12);
      return "Hace ${years.floor()} ${years.floor() == 1 ? "año" : "años"}";
    } else if (diaHoy == dia && mesHoy == mes && yearHoy == year) {
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      return "Hoy, $horaFormatted ";
    } else if ((-duration.inDays >= 1 && -duration.inDays < 6) &&
        ((int.parse(diaHoy) + 1 != (int.parse(dia))) &&
                (int.parse(diaHoy) != (int.parse(dia) + 30)) ||
            (int.parse(diaHoy) != (int.parse(dia) + 29)))) {
      String fechaFormatted = DateFormat.EEEE('es').format(dateTime);
      String diaFormatted = DateFormat.d('en').format(dateTime);
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      fechaFormatted = fechaFormatted.replaceAll('.', '');
      String mayusc = fechaFormatted.toUpperCase().substring(0, 1);
      fechaFormatted = fechaFormatted.replaceRange(0, 1, mayusc);
      return "$fechaFormatted $diaFormatted, $horaFormatted ";
    } else if (((int.parse(diaHoy) + 1 == (int.parse(dia))) ||
            (int.parse(diaHoy) == (int.parse(dia) + 30)) ||
            (int.parse(diaHoy) == (int.parse(dia) + 29))) &&
        (duration.inDays == -1 || duration.inDays == 0)) {
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      return "Mañana, $horaFormatted ";
    } else if (-duration.inDays >= 6 &&
        (int.parse(yearHoy) == int.parse(year))) {
      String fechaFormatted = DateFormat.MMMd('es').format(dateTime);
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      fechaFormatted = fechaFormatted.replaceAll('.', '');
      return "$fechaFormatted, $horaFormatted";
    } else if (int.parse(yearHoy) != int.parse(year)) {
      String fechaFormatted = DateFormat.yMMMMd('es').format(dateTime);
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      return "$fechaFormatted, $horaFormatted";
    } else {
      String horaFormatted = DateFormat.jm('en').format(dateTime);
      String fechaFormatted = DateFormat.MMMd('es').format(dateTime);
      String diaFormatted = DateFormat.d('en').format(dateTime);
      horaFormatted = horaFormatted.replaceAll('AM', 'a.m.');
      horaFormatted = horaFormatted.replaceAll('PM', 'p.m.');
      fechaFormatted = fechaFormatted.replaceAll('.', '');
      return "$fechaFormatted $diaFormatted, $horaFormatted ";
    }
  }

  // Recibe un DateTime y retorna un String de cuánto falta para llegar a esa fecha
  // Su uso es específico para la expiración de las ofertas
  static String remainingTime(DateTime expiryDate) {
    Duration difference = expiryDate.difference(DateTime.now());
    if (difference.isNegative || difference == Duration.zero) {
      return "Finalizó";
    } else if (difference.inMinutes == 0) {
      return "Menos de 1 minuto";
    } else if (difference.inMinutes <= 30) {
      return "${difference.inMinutes} minuto${difference.inMinutes == 1 ? "" : "s"}";
    } else if (difference.inHours < 1) {
      return "1 hora";
    } else if (difference.inDays < 1 && expiryDate.day == DateTime.now().day) {
      return "Hoy";
    } else if (difference.inDays < 2 &&
        expiryDate.day == DateTime.now().day + 1) {
      return "Mañana";
    } else {
      return difference.inDays == 1
          ? "${difference.inDays} día"
          : "${difference.inDays} días";
    }
  }

  // Recibe un int y retorna un String de
  static String formattedMoneyValue(int value,
      {bool showsCurrency = true, String currency = "COP"}) {
    String valorString = "$value";

    int puntos = (valorString.length / 3).floor();
    int sobran;
    if (valorString.length % 3 == 0) {
      sobran = 3;
    } else {
      sobran = ((valorString.length / 3 - puntos) * 3).round();
    }

    if (sobran == 0) {
      return "\$$valorString${showsCurrency ? " $currency" : ""}";
    } else {
      String sobraString = valorString.substring(0, sobran);
      String paraPuntos = valorString.substring(sobran);

      String conPunto = "";

      for (int i = 3; i <= paraPuntos.length; i = i + 3) {
        conPunto = "$conPunto.${paraPuntos.substring(i - 3, i)}";
      }

      return "\$$sobraString$conPunto${showsCurrency ? " $currency" : ""}";
    }
  }

  // Valida formato de mail
  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  // Recibe un int y retorna un String
  static String dateFormat(int date) {
    String formattedDate;
    DateTime hoy = DateTime.now();
    String diaHoy = DateFormat.d('es').format(hoy);
    String dia =
        DateFormat.d('es').format(DateTime.fromMillisecondsSinceEpoch(date));
    String mes =
        DateFormat.M('es').format(DateTime.fromMillisecondsSinceEpoch(date));
    String mesHoy = DateFormat.M('en').format(hoy);
    String year =
        DateFormat.y('es').format(DateTime.fromMillisecondsSinceEpoch(date));
    String yearHoy = DateFormat.y('es').format(hoy);
    Duration duration =
        DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(date));
    if (((int.parse(diaHoy) - 1 == (int.parse(dia))) ||
            (int.parse(diaHoy) == (int.parse(dia) - 30)) ||
            (int.parse(diaHoy) == (int.parse(dia) - 29))) &&
        duration.inDays < 2 &&
        duration.inDays >= 0) {
      formattedDate = DateFormat('h:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(date));
      formattedDate = formattedDate.replaceAll("PM", "p.m.");
      formattedDate = formattedDate.replaceAll("AM", "a.m.");
      formattedDate = "Ayer, $formattedDate";
    } else if (diaHoy == dia && mesHoy == mes && yearHoy == year) {
      formattedDate = DateFormat('h:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(date));
      formattedDate = formattedDate.replaceAll("PM", "p.m.");
      formattedDate = formattedDate.replaceAll("AM", "a.m.");
      formattedDate = "Hoy, $formattedDate";
    } else {
      formattedDate = DateFormat('EEEE dd MMMM')
          .format(DateTime.fromMillisecondsSinceEpoch(date));
      formattedDate = formattedDate.replaceAll("PM", "p.m.");
      formattedDate = formattedDate.replaceAll("AM", "a.m.");
      //
      formattedDate = formattedDate.replaceAll("Monday", "Lun.");
      formattedDate = formattedDate.replaceAll("Tuesday", "Mar.");
      formattedDate = formattedDate.replaceAll("Wednesday", "Mié.");
      formattedDate = formattedDate.replaceAll("Thursday", "Jue.");
      formattedDate = formattedDate.replaceAll("Friday", "Vie.");
      formattedDate = formattedDate.replaceAll("Saturday", "Sáb.");
      formattedDate = formattedDate.replaceAll("Sunday", "Dom.");
      //
      formattedDate = formattedDate.replaceAll("January", "enero");
      formattedDate = formattedDate.replaceAll("February", "febrero");
      formattedDate = formattedDate.replaceAll("March", "marzo");
      formattedDate = formattedDate.replaceAll("April", "abril");
      formattedDate = formattedDate.replaceAll("May", "mayo");
      formattedDate = formattedDate.replaceAll("June", "junio");
      formattedDate = formattedDate.replaceAll("July", "julio");
      formattedDate = formattedDate.replaceAll("August", "agosto");
      formattedDate = formattedDate.replaceAll("September", "septiembre");
      formattedDate = formattedDate.replaceAll("October", "octubre");
      formattedDate = formattedDate.replaceAll("November", "noviembre");
      formattedDate = formattedDate.replaceAll("Decembre", "diciembre");
    }

    return formattedDate;
  }
}
