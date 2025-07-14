void main() async {
  final String name = await fetchName();
  print('Мене звати $name');
}

// Task 1: Асинхронне отримання імені
// Створіть метод Future<String> fetchName(), який імітує асинхронну операцію.
// Цей метод повинен повертати ваше ім'я через 2 секунди (використайте Future.delayed та async/await).
// Виведіть результат у консоль у форматі: "Мене звати [результат виконання асинхронної операції]".

Future<String> fetchName() async {
  final name = await Future.delayed(const Duration(seconds: 2), () {
    return 'SomeName';
  });
  return name;
}
