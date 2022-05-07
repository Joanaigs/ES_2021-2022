enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

DayOfWeek parseDayOfWeek(String str){
  str = str.replaceAll(' ', '').toLowerCase();
  if(str == 'segunda-feira'  || str == 'monday') {
    return DayOfWeek.monday;
  } else if(str == 'terça-feira' || str == 'tuesday') {
    return DayOfWeek.tuesday;
  } else if(str == 'quarta-feira' || str == 'wednesday' ) {
    return DayOfWeek.wednesday;
  } else if(str == 'quinta-feira' || str == 'thursday') {
    return DayOfWeek.thursday;
  } else if(str == 'sexta-feira' || str == 'friday') {
    return DayOfWeek.friday;
  } else if(str == 'sábado' || str == 'sabado' || str == 'saturday') {
    return DayOfWeek.saturday;
  } else if(str == 'domingo' || str == 'sunday') {
    return DayOfWeek.sunday;
  } else {
    return null;
  }
}

String toString(DayOfWeek day){
  switch(day){
    case DayOfWeek.monday:
      return 'Segunda-feira';
    case DayOfWeek.tuesday:
      return 'Terça-feira';
    case DayOfWeek.wednesday:
      return 'Quarta-feira';
    case DayOfWeek.thursday:
      return 'Quinta-feira';
    case DayOfWeek.friday:
      return 'Sexta-feira';
    case DayOfWeek.saturday:
      return 'Sábado';
    case DayOfWeek.sunday:
      return 'Domingo';
  }
  return null;
}