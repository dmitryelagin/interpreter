import 'dart:collection';

class TraversableList<A, V> extends LinkedList<Traversable<A, V>> {
  TraverseResult<V> apply(A arg) =>
      isNotEmpty ? first.apply(arg) : const TraverseResult.fail();
}

abstract class Traversable<A, V> extends LinkedListEntry<Traversable<A, V>> {
  TraverseResult<V> applyWithFirst(A arg) => list != null && list!.isNotEmpty
      ? list!.first.apply(arg)
      : const TraverseResult.fail();

  TraverseResult<V> applyWithNext(A arg) =>
      next != null ? next!.apply(arg) : const TraverseResult.fail();

  TraverseResult<V> apply(A arg);
}

class TraverseResult<T> {
  const TraverseResult.success(T value)
      : isSuccess = true,
        _value = value;

  const TraverseResult.fail()
      : isSuccess = false,
        _value = null;

  final bool isSuccess;

  final T? _value;

  bool get isFail => !isSuccess;

  T getValue() => _value!;
}
