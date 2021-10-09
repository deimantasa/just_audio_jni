import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioStore()..init()),
      ],
      child: MaterialApp(
        title: 'Just Audio JNI Exception',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      body: const Center(child: Text('Home Page')),
    );
  }
}

class AudioStore extends BaseAudioHandler with SeekHandler, ChangeNotifier {
  bool _isAudioServiceInitialised = false;

  Future<void> init() async {
    if (!_isAudioServiceInitialised) {
      _isAudioServiceInitialised = true;

      await AudioService.init(
        builder: () => this,
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'package.namee',
          androidNotificationChannelName: 'Audio playback',
          androidNotificationOngoing: true,
          androidStopForegroundOnPause: true,
          androidShowNotificationBadge: true,
          androidNotificationIcon: 'drawable/ic_stat_ic_notification',
        ),
      );
    }
  }
}
