import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clickpay_bridge/flutter_clickpay_bridge.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_payment_sdk_bridge');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterPaytabsBridge.platformVersion, '42');
  });
}
