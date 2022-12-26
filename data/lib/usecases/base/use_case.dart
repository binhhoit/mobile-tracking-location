import 'dart:async';

import 'package:data/model/observer.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

abstract class SingleUseCase {
  execute();
}

abstract class UseCaseResult<T> extends SingleUseCase {
  @override
  Future<T> execute();
}

abstract class ReactiveUseCase<T, Params> {
  /// This contains all the subscriptions to the [Stream]
  late CompositeSubscription _disposables;
  late Logger _logger;

  Logger get logger => _logger;

  ReactiveUseCase() {
    _disposables = CompositeSubscription();
    _logger = Logger();
  }

  /// Builds the [Stream] to be subscribed to. [Params] is required
  /// by the [UseCase] to retrieve the appropraite data from the repository
  Future<Stream<T?>> buildUseCaseStream(Params? params);

  /// Subscribes to the [Stream] with the [Observer] callback functions.
  void execute(Observer<T> observer, [Params? params]) async {
    final StreamSubscription subscription = (await buildUseCaseStream(params))
        .listen(observer.onNext,
            onDone: observer.onComplete, onError: observer.onError);
    _addSubscription(subscription);
  }

  /// Subscribes to the [Stream] with [onNext], [onError], [onComplete] callbacks functions.
  void executeF({required Function(T?) onNext, required Function(dynamic) onError, required Function() onComplete, Params? params}) async {
    final StreamSubscription subscription = (await buildUseCaseStream(params))
        .listen(onNext,
            onDone: onComplete, onError: onError);
    _addSubscription(subscription);
  }

  /// Disposes (unsubscribes) from the [Stream]
  void dispose() {
    if (!_disposables.isDisposed) {
      logger.d('Disposing $runtimeType');
      _disposables.dispose();
    }
  }

  /// Adds a [StreamSubscription] i.e. the subscription to the
  /// [Stream] to the [CompositeSubscription] list of subscriptions.
  void _addSubscription(StreamSubscription subscription) {
    if (_disposables.isDisposed) {
      _disposables = CompositeSubscription();
    }
    _disposables.add(subscription);
  }
}
