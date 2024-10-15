import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class L {
  static void log(dynamic msg) {
    final Logger logger = Logger();
    logger.log(Level.debug, msg);
  }
}

class Observers extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    L.log('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "value": "$value",
      "container: "$container"
    }''');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    L.log('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
    }''');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    L.log('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "containers": "$containers"
    }''');
  }
}
