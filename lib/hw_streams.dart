import 'dart:io';

void main() {
  task06();
}

// Task 6: Стрім з чисел (fromIterable)
// Створіть Stream<int> з довільних чисел (наприклад, від 1 до 5) за допомогою Stream.fromIterable.
// Виведіть кожне значення з цього стріму, використовуючи конструкцію await for.
// Виведіть кожне значення з цього ж стріму, використовуючи метод listen.

void task06() async {
  final List<int> numbers = List.generate(10, (i) => i + 1);
  final Stream<int> numbersStream = Stream.fromIterable(numbers);
  stdout.write('await for: ');
  await for (var item in numbersStream) {
    stdout.write('$item, ');
  }
  stdout.write('\nlisten:    ');
  numbersStream.listen((event) {
    stdout.write('$event, ');
  });
}
