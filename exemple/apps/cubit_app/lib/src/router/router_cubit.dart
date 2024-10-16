import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cubit_app/src/router/app_router.dart';
import 'package:cubit_app/src/router/route_constants.dart';

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(AppRouter.router);

  void push(AppPage page) {
    state.push(page.routePath);
  }

  void pop() {
    state.pop();
  }

  void canPop() {
    state.canPop();
  }

  void pushNamed(AppPage page) {
    state.pushNamed(page.routeName);
  }

  void pushReplacementNamed(AppPage page, Object? extra) {
    state.pushReplacement(page.routePath, extra: extra);
  }

  void replace(AppPage page) {
    state.replace(page.routePath);
  }

  void goHome() {
    state.push(AppPage.home.routePath);
  }
}
