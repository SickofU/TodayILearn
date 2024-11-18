import 'package:flutter/cupertino.dart';
import 'hometab.dart';
import 'settingtab.dart';
import 'albumtab.dart';
import 'calendartab.dart';
// import 'package:http/http.dart' as http; // http 패키지 추가
// import 'dart:convert'; // JSON 파싱을 위해 추가
// import 'package:dio/dio.dart'; // DIO 패키지로 HTTP 통신
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // flutter_secure_storage 패키지
import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController(); // ID 컨트롤러
  final TextEditingController password = TextEditingController(); // 비밀번호 컨트롤러

  static final storage = FlutterSecureStorage(); // 플러터 시큐스토리지를 스토리지로 저장
  dynamic userInfo = ''; // storage  에 있는 유저 정보 저장

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    // userInfo = await storage.read(key: 'login');
    // if (userInfo != null) {
    //   Navigator.pushReplacement(
    //     context,
    //     CupertinoPageRoute(builder: (context) => MainTabPage()),
    //   );
    // } else {
    //   print("need login");
    // }
    print("need login");
  }

  // 서버 연동 없이 직접 페이지 전환
  Future<bool> loginAction(String accountName, String password) async {
    // 서버 연동 부분 주석 처리
    // try {
    //   var dio = Dio();
    //   var param = {'account_name': accountName, 'password': password};
    //   Response response = await dio.post('http://127.0.0.1:8080/api/login', data: param);

    //   if (response.statusCode == 200) {
    //     final jsonBody = json.decode(response.data['user_id'].toString());
    //     var val = jsonEncode(Login(accountName, password, jsonBody));
    //     await storage.write(
    //       key: 'login',
    //       value: val,
    //     );
    //     print("접속 성공");
    //     return true;
    //   } else {
    //     print('로그인 실패: ${response.statusCode}');
    //     return false;
    //   }
    // } catch (e) {
    //   print('오류 발생: $e');
    //   return false;
    // }
    return true; // 서버 연동 대신 성공을 가정하고 true 반환
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  'assets/app_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              // ID layout
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: CupertinoTextField(
                  controller: username,
                  placeholder: 'ID',
                ),
              ),
              // password layout
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: CupertinoTextField(
                  controller: password,
                  placeholder: 'Password',
                  obscureText: true,
                ),
              ),
              // login button layout
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: CupertinoButton.filled(
                  child: Text('Login'),
                  onPressed: () async {
                    bool success =
                        await loginAction(username.text, password.text);
                    if (success) {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => MainTabPage(),
                        ),
                      );
                    } else {
                      print("로그인 실패");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Calendar',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return HomeTab();
          case 1:
            return SettingsTab();
          case 2:
            return AlbumTab();
          case 3:
            return CalendarTab(); // CalendarTab 확인용
          default:
            return HomeTab();
        }
      },
    );
  }
}
