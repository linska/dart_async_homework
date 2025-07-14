import 'dart:io';

void main() {
  task06();
  task07();
}

// Task 6: Стрім з чисел (fromIterable)
// Створіть Stream<int> з довільних чисел (наприклад, від 1 до 5) за допомогою Stream.fromIterable.
// Виведіть кожне значення з цього стріму, використовуючи конструкцію await for.
// Виведіть кожне значення з цього ж стріму, використовуючи метод listen.

void task06() async {
  final List<int> numbers = List.generate(5, (i) => i + 1);
  final Stream<int> numbersStream = Stream.fromIterable(numbers);
  await for (var item in numbersStream) {
    print('await for:  $item');
  }
  numbersStream.listen((event) {
    print('listen:  $event');
  });
}

// Task 7: Зворотний відлік зі стріму (periodic)
// Створіть Stream<int> за допомогою Stream.periodic, який генерує числа з затримкою в 1 секунду.
// Обмежте відлік до 10 чисел за допомогою методу take.
// Виведіть кожне число у консоль у форматі: "1...", "2...", "3...", ... "10...".

void task07() async {
  final Stream<int> stream =
      Stream.periodic(Duration(seconds: 1), (v) => v + 1).take(10);
  stream.listen((e) {
    print('... $e ...');
  });
}
