import 'package:go_router/go_router.dart';
import 'package:sales_dashboard/dashboard/presentation/screens/screens.dart';
import 'package:sales_dashboard/map/presentation/screens/maps_screen.dart';
import 'package:sales_dashboard/dashboard/domain/repositories/local_storage_client_repository.dart';


late final ClienteRepository clienteRepository;
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: DashboardScreen.name,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/mapa',
      name: MapPage.name,
      builder: (context, state) => MapPage(),
    ),
  ],
);