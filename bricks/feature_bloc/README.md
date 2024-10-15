# feature_bloc

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A new brick created with the Mason CLI.

## Important Note

This brick works best with [this other brick](https://github.com/Olivier-plessis/melos_and_mason_bricks/tree/feature/melos_starter_app), that sets up the architecture mentioned above. It also prepares the ground for you to set up code generation, layering, etc.

### Folder architecture is based on solid principles

<p align="center">
<img src="https://miro.medium.com/v2/resize:fit:4800/format:webp/0*1w080Y72qaOdoC3W.png" height="525" alt="mason logo" />
</p>

## Installation 🚀

Once you have Mason installed,

you can add the **feature_bloc** brick to the configuration by adding the following code to your **mason.yaml** file:

```yaml
bricks:
  feature_bloc:
    git:
      url: "https://github.com/Olivier-plessis/melos_and_mason_bricks.git"
      path: bricks/feature_bloc
      ref: feature/bricks
```

or with this command

```sh
mason add feature_bloc --git-url='https://github.com/Olivier-plessis/melos_and_mason_bricks.git' --git-path='bricks/feature_bloc' --git-ref='feature/bricks'
```

## Usage 🕹️

To use the **feature_bloc** brick, and generate code. You can run the following command in your terminal:

```sh
mason get
```

and

```sh
mason make feature_bloc
```

### Properties for the Command Line ✨

| Variable             | Description                                                                                 | Default      | Type      |
| -------------------- | ------------------------------------------------------------------------------------------- | ------------ | --------- |
| `platform`           | Directory where the feature will be generated                                               | apps         | `enum`    |
| `appName`            | The name of your app                                                                        | flutter_app  | `string`  |
| `feature_name`       | The name of the feature                                                                     | feature_name | `string`  |
| `multibloc_provider` | Add the bloc provider to the multibloc provider                                             | false        | `boolean` |
| `page`               | Does this feature need a new page?                                                          | true         | `boolean` |
| `isStateFull`        | Pass true if you want to use isStateFull widget or just return if you don't need a new page | true         | `boolean` |
| `addToNavigationBar` | Add feature in the navigation bar or just in the stack?                                     | true         | `boolean` |

**Upon creating a new feature, you will be asked to specify the target platform. If it's your initial feature for this project, the platform-specific 'app' and 'package' directories will be auto-generated**

## Important Note to use it

### Enhanced Documentation: Automatic Routing Management 📖

**Overview**
When a new feature is created, our application's routing system is automatically updated to include the new page. This automation greatly simplifies development by avoiding manual route configuration.

**Impacted files**
Changes are made to the following files:

- **routes_constant.dart**: This file contains the definition of named routes used in the application. A new entry is added for the route corresponding to the new page.
- **app_routes.dart**: This file manages the global configuration of routes, including the application's initial route. It ensures consistency between the routes defined and their use in the application.
- **scaffold_with_nested_navigation.dart**: If you have specified that the new page should be accessible from the navigation bar, this file is updated. The NavigationRail and NavigationBar widgets are modified to include a new element corresponding to the new route.
  **A minimum of two menu items is required.**

## Output 📦

```sh
lib/
├── feature
│   ├── {{feature_name}}
│   │   ├── data
│   │   │   ├── source
│   │       │   ├── // add your own logic
│   │   │   └── repository
│   │       │   ├── {{feature_name}}_repository.dart
│   │   ├── domain
│   │   │   ├── model
│   │       │   ├── {{feature_name}}.dart
│   │   │   ├── repository
│   │       │   ├── {{feature_name}}_repository_impl.dart
│   │   └── presentation
│   │       ├── components
│   │       │   ├── {{feature_name}}_widget.dart
│   │       ├── page
│   │       │   ├── {{feature_name}}_screen.dart
│   │       ├── bloc
│   │       │   ├── {{feature_name}}_bloc.dart
│   │       │   ├── {{feature_name}}_event.dart
│   │       │   ├── {{feature_name}}_state.dart
```

Follow the instructions in the prompt and **VOILA**.
