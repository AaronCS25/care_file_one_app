import 'package:care_file_one/src/screens/alergia_add_screen.dart';
import 'package:care_file_one/src/screens/recetas_full_screen.dart';
import 'package:care_file_one/src/screens/recetas_screen.dart';
import 'package:care_file_one/src/screens/screens.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/login',
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'alergias',
          builder: (context, state) => const AlergiasScreen(),
          routes: [
            GoRoute(
                path: 'full/:alergiaId',
                builder: (context, state) {
                  final alergiaStringId = state.pathParameters['alergiaId'];
                  final alergiaId = alergiaStringId != null
                      ? int.parse(alergiaStringId)
                      : null;
                  if (alergiaId == null) {
                    //TODO: NOTIFICAMOS ERROR
                  }
                  return AlergiaFullScreen(alergiaId: alergiaId!);
                }),
            GoRoute(
              path: 'add',
              builder: (context, state) => const AlergiaAddScreen(),
            )
          ],
        ),
        GoRoute(
          path: 'medicacion',
          builder: (context, state) => const MedicacionScreen(),
        ),
        GoRoute(
          path: 'padecimientos',
          builder: (context, state) => const PadecimientosScreen(),
        ),
        GoRoute(
          path: 'cirugias',
          builder: (context, state) => const CirugiasScreen(),
        ),
        GoRoute(
            path: 'recetas',
            builder: (context, state) => const RecetasScreen(),
            routes: [
              GoRoute(
                  path: 'full/:recetaId',
                  builder: (context, state) {
                    final recetaStringId = state.pathParameters['recetaId'];
                    final recetaId = recetaStringId != null
                        ? int.parse(recetaStringId)
                        : null;
                    if (recetaId == null) {
                      //TODO: NOTIFICAMOS ERROR
                    }
                    return RecetaFullScreen(
                      recetaId: recetaId!,
                    );
                  }),
            ])
      ],
    ),
  ],
);
