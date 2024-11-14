import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// SeatBottom 클래스는 선택된 좌석 정보를 보여주고, 예약 버튼을 제공하는 위젯입니다.
class SeatBottom extends StatelessWidget {
  // 생성자: 선택된 행과 열을 받습니다.
  SeatBottom(this.selectedRow, this.selectedCol);

  // 선택된 열과 행을 저장하는 변수들입니다. null일 수 있습니다.
  int? selectedCol;
  int? selectedRow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // 컨테이너의 높이를 설정합니다.
      width: double.infinity, // 컨테이너의 너비를 화면 전체로 설정합니다.
      decoration: BoxDecoration(
        color: Colors.white, // 배경색을 흰색으로 설정합니다.
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // 상단 모서리를 둥글게 만듭니다.
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20, // 위젯 사이에 공간을 추가합니다.
          ),
          Text(
            // 선택된 좌석이 없으면 '선택된 자석 없음'을 표시하고, 있으면 좌석 위치를 표시합니다.
            selectedCol == null && selectedRow == null
                ? '선택된 자석 없음'
                : '$selectedCol - $selectedRow',
            style: TextStyle(
              fontSize: 20, // 글자의 크기를 설정합니다.
              fontWeight: FontWeight.bold, // 글자를 굵게 설정합니다.
            ),
          ),
          SizedBox(
            height: 20, // 위젯 사이에 공간을 추가합니다.
          ),
          SizedBox(
            width: 200, // 버튼의 너비를 설정합니다.
            height: 56, // 버튼의 높이를 설정합니다.
            child: ElevatedButton(
              onPressed: () {
                // 선택된 좌석이 있는지 확인
                if (selectedCol != null && selectedRow != null) {
                  // 이 부분이 추가된 조건문입니다.
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('예약확인'),
                        content: Text('예약 하시겠습니까?'),
                        actions: [
                          CupertinoDialogAction(
                            child: Text('취소'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('확인'),
                            isDestructiveAction: true,
                            onPressed: () {},
                          ),
                        ],
                      );
                    },
                  );
                } // 다이얼로그 호출을 여기서 조건부로 처리합니다.
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // 버튼의 배경색을 설정합니다.
              ),
              child: Text('Book now'), // 버튼에 표시되는 텍스트입니다.
            ),
          )
        ],
      ),
    );
  }
}
