import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(RowColumnDemo());

class RowColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // title bar가 없는 이유는 로그인화면이므로 없는 것이 자연스러우며 Scaffold 위젯에서 appBar 속성만 제거하면 됨.
      title: 'Login Form',
      debugShowCheckedModeBanner: false,
      home: Scaffold( // body 속성에는 전체 화면에 패딩을 주기 위해서 Container 위젯을 사용했다.
        // Container 위젯의 padding 속성으로는 EdgeInsets 위젯의 fromLTRB() 생성자를 호출했다.
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 120), //Edgelnests의 다양한 생성자들 .only() .symmetric() .formLTRB()
          child: Column( //세로로 배치할 것이니 Column 위젯
            children: <Widget>[
              Hero( // 이미지를 예쁘게 표현하기 위해 hero
                tag:'heoro',
                child: CircleAvatar( // 원형 이미지 생성.
                  child: Image.asset('images/logo.jpg'),
                  backgroundColor: Colors.transparent, // 배경색 투명
                  radius: 58.0, //unit: logical pixel? 반지름 속성 58dp
                )
              ),
              SizedBox(height: 45.0), // 빈 공백을 의미함 ! ! height와 width 지정 가능
              TextFormField( //텍스트를 입력받는 위젯 initialValue 속성은 초깃값을 지정하며 keyboardType은 IME(input method edito)입력기 종류 지정 가능
                // 입력기 종류 예시 .emailAddress .text .multiline(ex.메모내용) .number .phone .datetime .url
                keyboardType: TextInputType.emailAddress,
                initialValue: 'your_name@gmail.com',
                decoration: InputDecoration( //머터리얼 디자인을 따르는 텍스트 필드의 경계, 레이블, 아이콘, 스타일을 지정할 수 있다.
                  //이 클래스의 border 속성에는 윤곽선을 그려주는 OutlineInputBorder 클래스 지정
                border: OutlineInputBorder(),

              ),),
              SizedBox(height: 15.0),
              TextFormField(
                initialValue: 'input password',
                obscureText: true, //입력한 내용을 감춰야할 때 사용
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //중앙정렬
              children: <Widget>[
                ElevatedButton(onPressed: (){}, child: Text('Log In') // 아직 이벤트 처리자 등록하지 않음
                ),
                SizedBox(width: 10.0),
                ElevatedButton(onPressed: (){exit(0);}, // exit(0); 을 호출하면 앱 프로세스가 종료된다. import 'dart:io'를 한 이유. 이건 화면에 대한 표준 입출력을 담당
                    child: Text('Cancel')
                ),
              ],
              ),
            ],
          ),
        )
      )
    );
  }
}
