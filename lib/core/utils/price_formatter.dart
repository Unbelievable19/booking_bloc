String formatPrice(int number) {
  List<String> price = number.toString().split('');

  for (int i = price.length; i > 0;) {
    i -= 3;
    if (i <= 0) break;
    price.insert(i, ' ');
  }

  return price.join();
}
