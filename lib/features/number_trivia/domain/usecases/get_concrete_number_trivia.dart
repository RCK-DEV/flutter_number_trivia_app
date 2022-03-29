import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../core/error/failures.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia {
  NumberTriviaRepository numberTriviaRepository;

  GetConcreteNumberTrivia(this.numberTriviaRepository);

  Future<Either<Failure, NumberTrivia>> execute({required int number}) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(number);
  }
}
