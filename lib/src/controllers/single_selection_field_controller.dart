import '../common/get_items_state.dart';
import 'selection_field_controller.dart';

abstract class BaseSingleSelectionFieldController<Value> extends SelectionFieldController<Value> {
  
  BaseSingleSelectionFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  });

  List<Value> get items;
}

class SingleSelectionFieldController<Value> extends BaseSingleSelectionFieldController<Value> {
  
  final List<Value> _items;
  
  SingleSelectionFieldController({
    required List<Value> items,
    required super.areEqual,
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }): _items = items;

  @override
  List<Value> get items => _items;
}

abstract class RequestedSingleSelectionFieldController<Value> extends BaseSingleSelectionFieldController<Value> {

  GetItemsState getItemsState = GetItemsStateInitial();

  RequestedSingleSelectionFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  });

  void markAsLoading(){
    getItemsState = GetItemsStateLoading();
    notifyListeners();
  }

  void markAsFailed({
    required String message,
  }){
    getItemsState = GetItemsStateFailed(
      message: message,
    );
    notifyListeners();
  }

}

class GetOnceSingleSelectionFieldController<Value> extends RequestedSingleSelectionFieldController<Value> {

  List<Value> _items = [];

  GetOnceSingleSelectionFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  });

  void setItems({
    required List<Value> newItems,
  }) {
    _items = newItems;
    getItemsState = GetItemsStateSuccess(
      items: _items,
      hasMore: false,
    );
    notifyListeners();
  }

  @override
  List<Value> get items => _items;
}

class PaginatedSingleSelectionFieldController<Value> extends RequestedSingleSelectionFieldController<Value> {
  
  List<Value> _items = [];

  PaginatedSingleSelectionFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  });
  
  void setItems({
    required List<Value> newItems,
    required bool hasMore,
  }) {
    _items = newItems;
    getItemsState = GetItemsStateSuccess(
      items: newItems,
      hasMore: hasMore,
    );
    notifyListeners();
  }

  void addItems({
    required List<Value> newItems,
    required bool hasMore,
  }) {
    _items.addAll(newItems);
    getItemsState = GetItemsStateSuccess(
      items: _items,
      hasMore: hasMore,
    );
    notifyListeners();
  }
  
  @override
  List<Value> get items => _items;
}

