

import 'package:fpdart/fpdart.dart';
import 'package:testing/Core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
