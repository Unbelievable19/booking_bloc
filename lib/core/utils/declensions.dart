nightsDeclension(int nights) {
  if (nights % 10 == 1) {
    return 'ночь';
  } else if ([2, 3, 4].contains(nights % 10)) {
    return 'ночи';
  } else {
    return 'ночей';
  }
}

String touristDeclension(int id) {
  if (id >= 100) {
    return id.toString();
  }
  const Map<int, String> fromOneToNine = {
    1: 'Первый',
    2: 'Второй',
    3: 'Третий',
    4: 'Четвертый',
    5: 'Пятый',
    6: 'Шестой',
    7: 'Седьмой',
    8: 'Восьмой',
    9: 'Девятый',
  };
  const Map<int, String> fromTenToNineteen = {
    10: 'Десятый',
    11: 'Одиннадцатый',
    12: 'Двенадцатый',
    13: 'Тринадцатый',
    14: 'Четырнадцатый',
    15: 'Пятнадцатый',
    16: 'Шестнадцатый',
    17: 'Семнадцатый',
    18: 'Восемнадцатый',
    19: 'Девятнадцатый',
  };

  const Map<int, String> fromTwentyToNinetyRounded = {
    20: 'Двадцатый',
    30: 'Тридцатый',
    40: 'Сороковой',
    50: 'Пятидесятый',
    60: 'Шестидесятый',
    70: 'Семидесятый',
    80: 'Восьмидесятый',
    90: 'Девяностый',
  };

  const Map<int, String> fromTwentyToNinety = {
    2: 'Двадцать',
    3: 'Тридцать',
    4: 'Сорок',
    5: 'Пятьдесят',
    6: 'Шестьдесят',
    7: 'Семьдесят',
    8: 'Восемьдесят',
    9: 'Девяносто',
  };
  if (id < 20) {
    if (id < 10) {
      return fromOneToNine[id]!;
    } else {
      return fromTenToNineteen[id]!;
    }
  } else {
    if (id % 10 == 0) {
      return fromTwentyToNinetyRounded[id]!;
    } else {
      return '${fromTwentyToNinety[id ~/ 10]} ${fromOneToNine[id % 10]!.toLowerCase()}';
    }
  }
}
