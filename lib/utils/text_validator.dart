String? textValidator(
    {required String? text,
    required bool isRequired,
    String? pattern,
    String? matchPatternError}) {
  if (isRequired && (text == '' || text == null)) {
    return 'Это поле обязательно для заполнения';
  }
  if (pattern != null && text != null) {
    final hasMatch = RegExp(pattern).hasMatch(text);
    if (!hasMatch) {
      return matchPatternError ?? 'Текст в поле должен совпадать с паттерном';
    }
  }
  return null;
}
