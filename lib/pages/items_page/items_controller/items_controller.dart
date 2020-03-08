import 'package:mono_kit/mono_kit.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:wdb106_sample/model/model.dart';

import 'items_state.dart';

export 'items_state.dart';

class ItemsController extends StateNotifier<ItemsState> with LocatorMixin {
  ItemsController() : super(const ItemsState()) {
    _refresh();

    _sb.add(
      _itemStore.stocks.listen(
        (stocks) => state = state.copyWith(
          stocks: stocks,
          isLoading: false,
        ),
      ),
    );
  }

  final _sb = SubscriptionHolder();

  ApiClient get _client => read();
  ItemStore get _itemStore => read();

  Future<void> _refresh() async {
    _itemStore.update(await _client.getItemStocks());
  }

  @override
  void dispose() {
    _sb.dispose();

    super.dispose();
  }
}