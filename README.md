<p align="center"><img src="https://654448.smushcdn.com/2460692/wp-content/uploads/2021/05/Logo_Official_Tekengebied-1-kopie-14.png?lossy=1&strip=1&webp=1" width="100" height="100"></p>  

# GeniusArchitecture

This is a boilerplate project created in flutter using Provider, Firebase, Dio, and some fundamentals of Robert C Martin's Clean Architecture.

## Getting Started

The boilerplate is a minimal implementation that can be used to create a new project or library. It comes with a variety of basic components such as an app architecture, a theme, and necessary dependencies. The repository code can be used as an initializer to quickly build new projects and reduce the time it takes to develop them.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```  
https://github.com/GeniusCrew-B-V/genius-architecture-boilerplate.git  
```  

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```  
flutter pub get   
```  

**Step 3:**  
Change the package name by just doing a project wide search and replacing "com.baseprojectsrl.baseproject"  
to the one you desire

**Step 4:**

This project uses code generation for domain/network models and app localization, execute the following command to generate files:

```  
flutter packages pub run build_runner build --delete-conflicting-outputs  
```  

or watch command in order to keep the source code synced automatically:

```  
flutter packages pub run build_runner watch  
```  

**Step 5:**

Go to Firebase, create a new project, configure it and place the GoogleServices-Info.plist and google-services.json in the correct positions, if you skip this step the app will not run


## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```  
*.inject.summary;*.inject.dart;*.g.dart;  
```  

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```  
**/*.inject.summary  
**/*.inject.dart  
**/*.g.dart  
```  

## Boilerplate Features:

* Splash
* Lazy loaded lists
* Login
* Home
* Routing
* Theme
* Dio
* Database
* Provider (State Management)
* Validation
* Code Generation
* Dependency Injection
* Dark Theme Support
* Multilingual Support

### Folder Structure

Here is the folder structure we have been using in this project

```  
lib/  
|- dev/  
   |- main.dart  
|- i18n/  
|- prod/  
   |- main.dart  
|- resources/  
|- src/  
   |- base  
   |- home_page  
   |- login  
   |- post_detail  
   |- profile_page  
   |- signup  
   |- start  
   |- updates  
   |- app.dart  
```  

Now, lets dive into the lib folder which has the main code for the application.

```  
1- dev - This is where the starting point of the application in case we want to work in a hipotetycal   
       development enviroment  
2- i18n - Here we have all the .yaml files for each localization that we would need  
3- prod - This is where the starting point of the application in case we want to work in a hipotetycal   
        production enviroment  
4- resources - Here we have all the possible resources needed (Sizes,Image references etc.)  
5- src - This is where we develop the app itself  
   1- base - Base feature is where we manage the whole app which isn't specifically feature-related, and   
           instead it's app related. It contains all the non-feature releated data  
   2- home_page - Home page feature  
   3- login - Login page feature  
   4- post_detail - Post detail page feature  
   5- profile_page - Profile page  feature  
   6- signup - Signup page feature  
   7- start - Start feature is the first feature always launcher, it cointains basic navigation and auth   
            capabilities  
   8- updates- Updates page feature  
   9- app.dart - This is the real starting point of the application, where we inject all the  
              dependencies and run the app  
  
```  

### Feature structure

Each feature follow the main principles of the Clean Architecture paths.
```  
feature/  
|- data  
|- di  
|- domain  
|- ui  
```  

### Data

The Data layer consists of data source code such as Rest APIs, Access to local/remote databases, or any other data source.  
Here we follow a system of abstract classes in order to follow the signature of the methods defined in the Domain layer.  
This will complicate a bit the things, but allows us to have a robust code and will help also in the test/debugs faces.
```  
data/  
|- source/  
   |- feature_remote_data_source.dart  
   |- feature_remote_data_source_impl.dart  
|- feature_repository_impl.dart  
```  

### Di (Dependency injection)

Here is where we make a class independent of its own dependencies.  
This will enable us to separate different parts of the app in a more manageable way because each class can make calls to any dependency, it needs at any given time.
```  
di/  
|- feature_providers.dart  
```  

### Domain

The Domain folder contains the models which help draw and structure our data and the signature for the functions implemented in the data layer.  
This basically makes the domain layer a kind of 'glue' between Data and the UI/logic.
```  
di/  
|- model/  
   |- request_model.dart  
   |- response_model.dart  
|- feature_repository.dart  
```  

### Ui

In the UI Folder we manage Pages/ Navigation/ Widgets/ State Management (ViewModel).

- The Pages consist of the pages included in the feature we are working on. Which is built from smaller widgets regarding this feature.

- Navigator is where we add the logic of the navigation within that feature which allows us to move through the pages.

- The ViewModel is where we manage the state of these pages and the whole feature and the business logic of course.
```  
ui/  
|- model  
|- navigator  
|- pages  
|- viewmodel  
|- widget  
```  

### App.dart

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, title, orientation etc. The behavior of the app such as flavour, be endpoint etc. can be configured by using the class AppConfig. In this case we use dev/main.dart and prod/main.dart for handling such things.

#### dev/main.dart
```dart  
import 'package:flutter/material.dart';    
import '../src/app.dart';    
    
void main() {    
 WidgetsFlutterBinding.ensureInitialized();    
  mainCommon(    
     host: "https://31cae3b4-9771-4151-bdb2-41437d3b17ec.mock.pstmn.io",    
     isProd: false,  
  );    
}  
```  
#### app.dart
```dart  
import 'dart:io';    
    
import 'package:firebase_core/firebase_core.dart';    
import 'package:firebase_crashlytics/firebase_crashlytics.dart';    
import 'package:flutter/cupertino.dart';    
import 'package:flutter/foundation.dart';    
import 'package:flutter/material.dart';    
import 'package:flutter/services.dart';    
import 'package:flutter_displaymode/flutter_displaymode.dart';    
import 'package:flutter_localizations/flutter_localizations.dart';    
import 'package:provider/provider.dart';    
import 'package:shared_preferences/shared_preferences.dart';    
    
import '../resources/app_config.dart';    
import 'base/settings/di/theme_providers.dart';    
import 'base/settings/ui/viewmodel/theme_viewmodel.dart';    
import 'base/token/di/token_providers.dart';    
import 'base/widget/ui/custom_circular_progress_indicator.dart';    
import 'start/di/start_page_providers.dart';    
import 'start/ui/navigator/start_page_navigator.dart';    
    
void mainCommon({required String host, required bool isProd, required String onesignalAppID}) async {    
 await WidgetsFlutterBinding.ensureInitialized();    
  await Firebase.initializeApp();    
  if(Platform.isAndroid) {    
 await FlutterDisplayMode.setHighRefreshRate();    
  }    
  final prefs = await SharedPreferences.getInstance();    
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(    
 (value) => runApp(    
        MultiProvider(    
           providers: themePageProviders(prefs),    
           builder: (context, __) {    
              final themeViewModel = context.watch<ThemeViewModel>();    
              return App(    
                 host: host,    
                 isProd: isProd,    
                 themeViewModel: themeViewModel,    
              );    
           },     
       ),    
    ),    
  );    
}  
```  
&nbsp;  
&nbsp;  
&nbsp;  
&nbsp;
<p align="center"><img src="https://654448.smushcdn.com/2460692/wp-content/uploads/2021/05/Logo_Official_Tekengebied-1-kopie-14.png?lossy=1&strip=1&webp=1" width="100" height="100"></p>  
<h3><p align="center">GeniusCrew B.V</p></h3>
<p align="center">Van Coothplein 53</p>
<p align="center">4811 ND, Breda</p>
<p align="center">The Netherlands</p>