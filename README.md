<p align="center">
 <a href="https://melos.invertase.dev/~melos-latest">
  <img src="https://static.invertase.io/assets/melos-logo.png" alt="Melos"  height="125" alt="melos logo" />
  </a>
<img src="https://raw.githubusercontent.com/felangel/mason/master/assets/mason_full.png" height="100" alt="mason logo" />
</p>

<p align="center">
  <a href="https://github.com/invertase/melos#readme-badge"><img src="https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square" alt="Melos" /></a>
<a href="https://github.com/felangel/mason/actions"><img src="https://github.com/felangel/mason/workflows/mason/badge.svg" alt="mason"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

<p align="center">
  <span>A tool for managing Dart projects with multiple packages, inspired by <a href="https://lerna.js.org">Lerna</a>.</span>
</p>

<p align="center">
A collection of bricks that enable developers to be more productive when writing code.
</p>

---

## Installation 💾

Install Melos as a global package via pub.dev so it can be used from anywhere on your system:

``` sh
dart pub global activate melos
```
And if you want to use Mason to generate code, install it as a global package via pub.dev so it can be used from anywhere on your system:
``` sh
dart pub global activate mason_cli
```


## Usage 🕹️

You can run the following command in your terminal:
procede to intialize the melos project
 - in the melos.yaml file, change the name of the project
``` sh
name: starter_app
```

and run

``` sh
melos bs
```


## Output 📦

``` sh
project_name
├── app
│   ├── app_name
├── packages
│   ├── packages_name
├── mason.yaml  //remove if you don't need it
├── melos.yaml
├── pubspec.yaml
├── README.md 
├── analysis_options.yaml 
├── all_lint_rules.yaml 
 ```
