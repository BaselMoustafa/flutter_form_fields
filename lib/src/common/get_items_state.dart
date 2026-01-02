abstract class GetItemsState {}

class GetItemsStateInitial extends GetItemsState {}

class GetItemsStateLoading extends GetItemsState {}

class GetItemsStateFailed extends GetItemsState {
  final String message;

  GetItemsStateFailed({
    required this.message,
  });
}

class GetItemsStateSuccess<Value> extends GetItemsState {

  final bool hasMore;
  final List<Value> items;

  GetItemsStateSuccess({
    required this.hasMore,
    required this.items,
  });
}