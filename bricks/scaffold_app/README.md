# scaffold_app

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A new brick created with the Mason CLI.

## Getting Started 🚀

 **scaffold_app**, lets you :

- Set-up a base Flutter project with **up-to-date dependencies**
- Customize the usage of Riverpod's ecosystem: codegen hooks freezed We've got you covered
- Select your platforms (android, ios, ...)
- Use certain analysis customizations by default, with analysis_options.dart and flutter_lints (by default).
- For the example, this brick generates a counter and a dark/light theme selector managed on Riverpod.


## Update


| Date             | Description                                                      | 
| ---------------- | ---------------------------------------------------------------- | 
| `October 8 2024`   | Add state management Bloc. You can choose between Riverpod or Bloc |
| `October 14 2024`   | Add state management Cubit. You can choose between Riverpod or Bloc or Cubit |


### Dependency installed by default

Before anything, take a look @ [its dependencies](hooks/post/add_dependencies.dart).

And dev dependencies, take a look @ [its dev dependencies](hooks/post/add_dev_dependencies.dart).

## Installation

Once you have Mason installed,

you can add the **scaffold_app** brick to the configuration by adding the following code to your **mason.yaml** file:

``` yaml
bricks:
  scaffold_app:
    git:
      url: "https://github.com/Olivier-plessis/melos_and_mason_bricks.git"
      path: bricks/scaffold_app
      ref: feature/bricks
```

or with this command

```sh
mason add scaffold_app --git-url='https://github.com/Olivier-plessis/melos_and_mason_bricks.git' --git-path='bricks/scaffold_app' --git-ref='feature/bricks'
```

## Usage 🕹️

To use this brick, and generate code. You can run the following command in your terminal:

``` sh
mason get
```

and

``` sh
mason make scaffold_app
```

Then add your properties! 
## Variables for the Command Line ✨

| Variable             | Description                                                | Default                                         | Type     |
| -------------------- | ---------------------------------------------------------- | ----------------------------------------------- | -------- |
| `name`                | The name of the project                                   | flutter_app                                     | `string` |
| `org`                 | The name of the organization                              | com.example                                     | `string` |
| `description`         | The description of your app                               | An awesome flutter app generate by mason        | `string` |
| `platforms`           | Select your platform desired                              | android, ios, macos, windows, linux, web        | `array`  |
| `state_management`           | Select your state management desired                              | riverpod, bloc or cubit        | `enum`  |
| `add_dependencies`    | Add dependencies to your project and separate them with a comma | ''                                       | `string` |
| `add_dev_dependencies`| Add dev dependencies to your project and separate them with a comma | ''                                   | `string` |
| `codegen`             | Do you want to use go_router_builder?                      | false                                          | `boolean`|

##
Follow the instructions in the prompt and **VOILA**, your app is now installed inside app folder and configured.

## Output 📦

``` sh
{{name}}/
├── lib/
│   ├── src
│   │   ├── common_widgets
│   │   │   ├── custom_appbar_widget.dart // just an exemple
│   │   ├── core
│   │   │   ├── theme
│   │       │   ├── app_theme_data.dart // extending ThemeData
│   │       │   ├── dark_theme.dart // using flex_color_scheme
│   │       │   ├── light_theme.dart // using flex_color_scheme
│   │       │   ├── theme_mode_controller.dart // Riverpod
│   │       │   ├── brightness_theme // Bloc or Cubit
│   │   │   ├── utils
│   │       │   ├── bloc_observer.dart // Bloc or Cubit
│   │       │   ├── dio_provider.dart // Riverpod
│   │       │   ├── observers.dart // Riverpod
│   │       │   ├── logger_interceptor.dart
│   │       │   ├── register_error_handler.dart // to display error in app
│   │   │   ├── services
│   │       │   ├── bloc_widget.dart // Bloc or Cubit - MultiBlocProvider to declare your global blocs
│   │   └── feature
│   │       ├── counter
│   │       │   ├── ├── presentation
│   │       │   │   ├──  ├── provider // Riverpod
│   │       │   ├──         ├── counter_provider.dart
│   │       │   │   ├──  ├── bloc // Cubit
│   │       │   ├──         ├── counter_cubit.dart
│   │       │   │   ├──  ├── bloc // Bloc
│   │       │   ├──         ├── counter_bloc.dart
│   │       │   ├──         ├── counter_state.dart
│   │       │   ├──         ├── counter_event.dart
│   │       │   ├── ├──  ├── counter_screen.dart
│   │       │   ├── ├──  ├── empty_screen.dart
│   │   └── router
│   │       ├── app_router.dart // go_router provider
│   │       ├── app_routes.dart // go_router routes
│   │       ├── route_constants.dart // constants for go_router and create if you don't want to use go_router_builder
│   │       ├── app_shell_routes.dart // go_router routes for the shell navigation with go_router_builder
│   │       ├── route_constants.dart // constants for go_router
│   │       ├── not_found_screen.dart // not found screen
│   │       ├── scaffold_with_nested_navigation.dart // scaffold with  navigation bar and navigation rail
│   │       ├── router_bloc.dart // Bloc
│   │       ├── router_cubit.dart // Cubit
│   │   └── app.dart
│   │   └── splash_screen.dart // splash screen
│   ├── main.dart
 ```


The analysis_options file in your new project is already configured to use the custom_lint plugin.

``` sh
import: ../../analysis_options.yaml
analyzer:
  plugins:
    - custom_lint
```


