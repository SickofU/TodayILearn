import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CalendarTab extends StatefulWidget {
  const CalendarTab({super.key});

  @override
  State<CalendarTab> createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  DateTime selectedDate = DateTime.now();
  DateTime focusedDate = DateTime(2024, 10, 1);
  XFile? _uploadedImage;
  final TextEditingController _textController = TextEditingController();

  void _changeMonth(int offset) {
    setState(() {
      focusedDate = DateTime(
        focusedDate.year,
        focusedDate.month + offset,
        1,
      );
    });
  }

  void _showUploadModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            "${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    _uploadedImage = image;
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('이미지 업로드'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _showTextInputModal(context);
              },
              child: const Text('텍스트 입력'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('취소'),
          ),
        );
      },
    );
  }

  void _showTextInputModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPopupSurface(
          isSurfacePainted: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoTextField(
                  controller: _textController,
                  placeholder: '텍스트 입력',
                ),
                const SizedBox(height: 16),
                CupertinoButton.filled(
                  onPressed: () {
                    print('저장된 텍스트: ${_textController.text}');
                    Navigator.pop(context);
                  },
                  child: const Text('저장'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const double fontSize = 14; // 텍스트 크기
    const double popupWidth = 300; // 팝업 너비
    const double popupHeight = 350; // 팝업 높이

    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          width: popupWidth,
          height: popupHeight,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: CupertinoColors.black,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // 캘린더 헤더
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => _changeMonth(-1),
                    child: const Icon(CupertinoIcons.left_chevron),
                  ),
                  Text(
                    "${focusedDate.year}년 ${focusedDate.month}월",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => _changeMonth(1),
                    child: const Icon(CupertinoIcons.right_chevron),
                  ),
                ],
              ),

              // 요일 표시
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('SUN',
                        style: TextStyle(color: CupertinoColors.systemRed)),
                    Text('MON'),
                    Text('TUE'),
                    Text('WED'),
                    Text('THU'),
                    Text('FRI'),
                    Text('SAT',
                        style: TextStyle(color: CupertinoColors.systemBlue)),
                  ],
                ),
              ),

              // 날짜
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: DateTime(
                    focusedDate.year,
                    focusedDate.month + 1,
                    0,
                  ).day, // 해당 월의 총 일수
                  itemBuilder: (BuildContext context, int index) {
                    final date = DateTime(
                        focusedDate.year, focusedDate.month, index + 1);

                    bool isToday = date.day == DateTime.now().day &&
                        date.month == DateTime.now().month &&
                        date.year == DateTime.now().year;

                    bool isSelected = date.day == selectedDate.day &&
                        date.month == selectedDate.month &&
                        date.year == selectedDate.year;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                        _showUploadModal(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? CupertinoColors.activeOrange
                              : isToday
                                  ? CupertinoColors.systemRed
                                  : CupertinoColors.systemGrey5,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: isSelected || isToday
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                        ),
                      ),
                    );
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
