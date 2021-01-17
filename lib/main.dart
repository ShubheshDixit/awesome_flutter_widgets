import 'package:awesome_ui_widgets/widgets/awesome_buttons.dart';
import 'package:awesome_ui_widgets/widgets/awesome_textfield.dart';
import 'package:awesome_ui_widgets/components/dialogs.dart';
import 'package:awesome_ui_widgets/widgets/awesome_containers.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:theme_mode_handler/theme_mode_manager_interface.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeModeHandler(
      manager: ThemeModeManager(),
      builder: (ThemeMode themeMode) {
        return MaterialApp(
          themeMode: themeMode,
          darkTheme: ThemeData(
            fontFamily: 'GothamBold',
            buttonColor: Colors.green[500],
            brightness: Brightness.dark,
            primaryColor: Colors.green[500],
            primarySwatch: Colors.green,
            accentColor: Colors.deepOrange, //Color(0xff7289DA),
            // accentColor: Colors.deepOrange,
          ),
          theme: ThemeData(
            fontFamily: 'GothamBold',
            brightness: Brightness.light,
            buttonColor: Colors.green,
            primaryColor: Colors.green,
            primarySwatch: Colors.green,
            accentColor: Colors.deepOrange,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ThemeModeManager implements IThemeModeManager {
  static const _key = 'example_theme_mode';

  @override
  Future<String> loadThemeMode() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_key);
  }

  @override
  Future<bool> saveThemeMode(String value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(_key, value);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkModeEnabled = false;
  double orgin = 0.0;
  @override
  void initState() {
    super.initState();
    isDarkModeEnabled =
        ThemeModeHandler.of(context).themeMode == ThemeMode.dark;
  }

  changeTheme(isDarkModeEnabled) {
    if (!isDarkModeEnabled) {
      setState(() {
        isDarkModeEnabled = true;
      });
      ThemeModeHandler.of(context).saveThemeMode(ThemeMode.dark);
    } else {
      setState(() {
        isDarkModeEnabled = false;
      });
      ThemeModeHandler.of(context).saveThemeMode(ThemeMode.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // buildLongSwitch(isDarkModeEnabled, (isDarkModeEnabled) {
          //   if (!isDarkModeEnabled) {
          //     setState(() {
          //       isDarkModeEnabled = true;
          //     });
          //     ThemeModeHandler.of(context).saveThemeMode(ThemeMode.dark);
          //   } else {
          //     setState(() {
          //       isDarkModeEnabled = false;
          //     });
          //     ThemeModeHandler.of(context).saveThemeMode(ThemeMode.light);
          //   }
          // }),
          buildLongSwitch(isDarkModeEnabled, (isDarModeEnabled) {
            if (!isDarkModeEnabled) {
              setState(() {
                isDarkModeEnabled = true;
              });
              ThemeModeHandler.of(context).saveThemeMode(ThemeMode.dark);
            } else {
              setState(() {
                isDarkModeEnabled = false;
              });
              ThemeModeHandler.of(context).saveThemeMode(ThemeMode.light);
            }
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return ImageDialog(
                              // 'https://media.giphy.com/media/l378iuMLWH7Vtxkbu/giphy.gif',
                              // 'https://media.giphy.com/media/3ohhwx480vzXoISaTS/giphy.gif',
                              image: Image.network(
                                'https://media.giphy.com/media/Q5ExYVcK1Swjl6mtLx/giphy.gif',
                                fit: BoxFit.cover,
                              ),
                              title: 'Great Spongbob Dance',
                              isCentered: false,
                              imageBGColor: Colors.transparent,
                              imageFit: BoxFit.cover,
                              imageRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100)),
                              // removeCancel: true,
                              isActionsExpanded: true,
                              cancelColor: Colors.grey,
                              // imageWidth: 200,
                              // imageHeight: 200,
                              fontFamily: 'GothamBold',
                              bodyText:
                                  "This is an image of spongbob dancing like hell.",
                            );
                          },
                        );
                      },
                      child: Text('Show Image PopUp Dialog'),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return IconDialog(
                              FontAwesomeIcons.trash,
                              'This is an icon dialog',
                              bodyText: 'This is more about the icon dialog',
                              iconColor: Colors.red,
                              iconSize: 80.0,
                              iconBGColor: Colors.grey[300],
                              iconPadding: EdgeInsets.all(20),
                              iconsBGRadius: 400.0,
                              actionsAlignment: MainAxisAlignment.center,
                              isActionsExpanded: true,
                            );
                          },
                        );
                      },
                      child: Text('Show Icon PopUp Dialog'),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomChildDialog(
                              'This is title',
                              labelText: 'Add Files',
                              topChildHeight: 200,
                              topChild: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child:
                                    // SvgPicture.asset(
                                    //   'images/undraw_Add_files_re_v09g.svg',
                                    //   fit: BoxFit.contain,
                                    //   height: 100,
                                    // )
                                    Image.network(
                                  'https://media.giphy.com/media/8Ffyo3xSP98WVns3UQ/giphy.gif',
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              // topChild: Image.network(
                              //   'https://media.giphy.com/media/3ohhwx480vzXoISaTS/giphy.gif',
                              //   height: 300,
                              //   fit: BoxFit.contain,
                              // ),
                            );
                          },
                        );
                      },
                      child: Text('Show Custom Child Dialog'),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0.0,
                              child: AwesomeContainer(
                                // containerHeight: 150,
                                // containerWidth: 150,
                                onActionPressed: () => Navigator.pop(context),
                                contentHorizontalAlignment:
                                    CrossAxisAlignment.start,
                                title: Text(
                                  'Add Files',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900),
                                ),
                                isLabelHidden: false,
                                isTopChildCentered: false,
                                // topChildBorderRadius: BorderRadius.circular(500),
                                // topChildBgColor: Colors.white,
                                topChildWidth: 150,
                                topChildPadding: EdgeInsets.all(10),
                                overflowChildWidget: Image.network(
                                  'https://media.giphy.com/media/3ohhwx480vzXoISaTS/giphy.gif',
                                  fit: BoxFit.contain,
                                ),
                                // actionWidget: SizedBox.shrink(),
                              ),
                            );
                          },
                        );
                      },
                      child: Text('Show Awesome Dialog'),
                    ),
                  ),
                  // RaisedButton(
                  //   onPressed: () {
                  //     // print(res.toString());
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => OnBoard()));
                  //   },
                  //   child: Text('Get Info'),
                  // ),
                  AwesomeTextField(
                    prefixIcon: Icon(FontAwesomeIcons.solidEnvelope),
                    borderRadius: BorderRadius.circular(50),
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    hintText: 'Username',
                  ),
                  AwesomeTextField(
                    labelText: 'Password',
                    // prefixIcon: Icon(FontAwesomeIcons.lock),
                    borderRadius: BorderRadius.circular(8),
                    prefixIcon: SizedBox(
                      width: 5,
                    ),
                    prefixIconConstraints: BoxConstraints(maxWidth: 20),
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    isPassword: true,
                    // backgroundColor: Colors.red,
                  ),
                  AwesomeTextField(
                    minLines: 5,
                    maxLines: 6,
                    labelText: 'Bio',
                    maxLength: 100,
                    borderRadius: BorderRadius.circular(5),
                    borderType: InputBorderType.underlined,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.2))
                    ],
                    // backgroundColor: Colors.red,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AwesomeButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'images/intro.png',
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Hello'),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildLongSwitch(isDarkModeEnabled, onStateChanged) {
  return DayNightSwitcher(
    isDarkModeEnabled: isDarkModeEnabled,
    onStateChanged: onStateChanged ?? (isDarkModeEnabled) => {},
  );
}

class GetInfo {
  final url;
  GetInfo(this.url);

  // Future<dynamic> get response async => await http.get(this.url);
}
