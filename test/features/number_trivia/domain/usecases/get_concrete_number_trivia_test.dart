import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_number_trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockTriviaNumberRepository;

  setUp(() {
    mockTriviaNumberRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockTriviaNumberRepository);
  });

  final testNumber = 1;
  final testNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should get trivia for the number from the repository', () async {
    // arange
    when(mockTriviaNumberRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(testNumberTrivia));
    // act
    final result = await usecase.execute(number: testNumber);
    // assert
    expect(result, Right(testNumberTrivia));
    verify(mockTriviaNumberRepository.getConcreteNumberTrivia(testNumber));
    verifyNoMoreInteractions(mockTriviaNumberRepository);
  });
}
