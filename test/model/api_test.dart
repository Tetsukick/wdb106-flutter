import 'package:flutter_test/flutter_test.dart';
import 'package:wdb106_sample/model/api.dart';

void main() {
  test('api test', () async {
    final target = MockyApiClient();
    final stocks = await target.getItemStocks();
    expect(stocks.length, 5);
    final stock = stocks.first;
    final item = stock.item;
    expect(item.id, 100);
    expect(item.price, 1480);
    expect(item.title, 'WEB+DB PRESS 100');
    expect(item.imageUrl,
        'https://gihyo.jp/assets/images/gdp/2017/978-4-7741-9229-1.jpg');
    expect(stock.quantity, 5);
  });
}
