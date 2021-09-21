calculateTime(String time) {
  DateTime postTime = DateTime.parse(time).toLocal();
  String minute = postTime.minute.toString();
  if (postTime.minute < 10) {
    minute = '0${postTime.minute}';
  }
  if (postTime.year != DateTime.now().year) {
    return ("${postTime.day} ${getMonth(postTime.month)} ${postTime.year}");
  } else if (postTime.day != DateTime.now().day) {
    return ("${postTime.day} ${getMonth(postTime.month)} ${postTime.hour}:$minute");
  }
  return ("Bugün ${postTime.hour}:$minute");
}

String getMonth(month) {
  switch (month) {
    case 1:
      return "Ocak";
    case 2:
      return "Şubat";
    case 3:
      return "Mart";
    case 4:
      return "Nisan";
    case 5:
      return "Mayıs";
    case 6:
      return "Haziran";
    case 7:
      return "Temmuz";
    case 8:
      return "Ağustos";
    case 9:
      return "Eylül";
    case 10:
      return "Ekim";
    case 11:
      return "Kasım";
    case 12:
      return "Aralık";
    default:
      return "Unknown";
  }
}
