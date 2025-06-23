import 'dart:async';

class DisposeBag {
  final List<StreamSubscription> _subscriptions = [];
  final List<void Function()> _disposables = [];

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  void addDisposable(void Function() disposable) {
    _disposables.add(disposable);
  }

  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();

    for (final disposable in _disposables) {
      try {
        disposable();
      } catch (_) {
        // Ignore disposal errors
      }
    }
    _disposables.clear();
  }
}
