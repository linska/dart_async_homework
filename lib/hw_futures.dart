void main() {
  task01();
  task02();
  task03();
  task04();
}

// Task 1: Асинхронне отримання імені
// Створіть метод Future<String> fetchName(), який імітує асинхронну операцію.
// Цей метод повинен повертати ваше ім'я через 2 секунди (використайте Future.delayed та async/await).
// Виведіть результат у консоль у форматі: "Мене звати [результат виконання асинхронної операції]".

void task01() async {
  final String name = await fetchName();
  printName(name);
}

Future<String> fetchName() async {
  final name =
      await Future.delayed(const Duration(seconds: 2), () => 'SomeName');
  return name;
}

void printName(String name) {
  print('Мене звати $name');
}

// Task 2: Асинхронне отримання віку
// Створіть метод Future<String> fetchAge(), який імітує асинхронну операцію.
// Цей метод повинен повертати рядок "25" через 1500 мілісекунд.
// Виведіть результат у консоль у форматі: "Мені [ваш вік] років".
// Реалізуйте логіку, щоб слово "рік" змінювалося відповідно до значення віку (наприклад: 21 рік, 22 роки, 25 років).

void task02() async {
  final String age = await fetchAge();
  printAge(age);
}

Future<String> fetchAge() async {
  final age =
      await Future.delayed(const Duration(milliseconds: 1500), () => '25');
  return age;
}

void printAge(String age) {
  final String check = age.substring(age.length - 1);
  final String years = switch (check) {
    '1' => 'рік',
    '2' || '3' || '4' => 'роки',
    _ => 'років'
  };
  print('Мені $age $years');
}

// Task 3: Послідовне виконання Future
// Виконайте методи fetchName() та fetchAge() послідовно.
// Виміряйте та виведіть час виконання обох методів.

void task03() async {
  final stopwatch = Stopwatch();
  stopwatch.start();
  print('Старт послідовного виконання');
  // await fetchName().then((v) async {
  //   await fetchAge();
  // });
  await fetchName();
  await fetchAge();
  print('Час при послідовному виконанні: ${stopwatch.elapsedMilliseconds}');
  stopwatch.stop();
}

// Task 4: Паралельне виконання Future (Future.wait)
// Виконайте методи fetchName() та fetchAge() паралельно за допомогою Future.wait.
// Виміряйте та виведіть час виконання.

void task04() async {
  final stopwatch = Stopwatch();
  stopwatch.start();
  print('Старт паралельного виконання');
  await Future.wait([fetchName(), fetchAge()]);
  print('Час при паралельному виконанні: ${stopwatch.elapsedMilliseconds}');
  stopwatch.stop();
}
