import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';


mixin HandlingExceptionManager {
  Future<Either<Failure, T>> wrapHandling<T>({
    required Future<Right<Failure, T>> Function() tryCall,
    Future<T?> Function()? tryCallLocal,
  }) async {
    try {
      final right = await tryCall();
      return right;
    } on UnauthenticatedException catch (e) {
      log("<<UnauthenticatedException>>");
      return Left(UnauthenticatedFailure(e.message));
    } on ValidationException catch (e) {
      log("<<validateRegister>>");
      return Left(ValidationFailure(e.message));
    }
    }
  }

