import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_dashboard/config/config.dart';
import 'package:sales_dashboard/config/router/app_router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Configuración de notificaciones locales
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// Esta función maneja los mensajes cuando la app está en segundo plano
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}


// Esta función muestra la notificación local
Future<void> _showNotification(RemoteNotification notification) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your_channel_id', 
    'your_channel_name', 
    channelDescription: 'Descripción de tu canal',
    importance: Importance.high,
    priority: Priority.high,
  );
  const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    notification.title,
    notification.body,
    platformChannelSpecifics,
    payload: 'mapa',
  );
}



// Obtiene el token de FCM
void getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("Token: $token");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Inicializa el plugin de notificaciones locales
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Configura FirebaseMessaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Mensaje recibido en primer plano: ${message.notification?.title}');
    
    // Si la aplicación está en primer plano, muestra la notificación local
    if (message.notification != null) {
      _showNotification(message.notification!);

      // Verifica si contiene datos de enrutamiento
      if (message.data.containsKey('route')) {
        final route = message.data['route'];
        // Navega a la ruta usando GoRouter
        appRouter.push(route);
      }
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Mensaje abierto desde notificación: ${message.data}');
    
    // Navega a la ruta especificada
    if (message.data.containsKey('route')) {
      final route = message.data['route'];
      appRouter.push(route);
    }
  });

  flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('app_icon'),
    ),
    onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
      final String? payload = notificationResponse.payload;
      if (payload != null) {
        appRouter.push(payload); // Navega a la ruta especificada
      }
    },
  );

  getToken(); // Obtiene el token FCM
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
