import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bloc_app/src/router/app_router.dart';
import 'package:bloc_app/src/router/route_constants.dart';

abstract class RouterEvent {}

class PushEvent extends RouterEvent {
  final AppPage page;
  PushEvent(this.page);
}

class PopEvent extends RouterEvent {}

class PushNamedEvent extends RouterEvent {
  final AppPage page;
  PushNamedEvent(this.page);
}

class PushReplacementNamedEvent extends RouterEvent {
  final AppPage page;
  final Object? extra;
  PushReplacementNamedEvent(this.page, this.extra);
}

class ReplaceEvent extends RouterEvent {
  final AppPage page;
  ReplaceEvent(this.page);
}

class GoHomeEvent extends RouterEvent {}

class RouterBloc extends Bloc<RouterEvent, GoRouter> {
  RouterBloc() : super(AppRouter.router) {
    on<PushEvent>((event, emit) {
      state.push(event.page.routePath);
    });

    on<PopEvent>((event, emit) {
      state.pop();
    });

    on<PushNamedEvent>((event, emit) {
      state.pushNamed(event.page.routeName);
    });

    on<PushReplacementNamedEvent>((event, emit) {
      state.pushReplacement(event.page.routePath, extra: event.extra);
    });

    on<ReplaceEvent>((event, emit) {
      state.replace(event.page.routePath);
    });

    on<GoHomeEvent>((event, emit) {
      state.push(AppPage.home.routePath);
    });
  }
}
