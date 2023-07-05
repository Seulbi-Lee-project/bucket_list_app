import 'package:flutter/material.dart';

import 'main.dart';

/// 버킷 클래스
class Bucket {
  String content; // 할 일
  bool isDone; // 완료 여부
  bool pinState; // 핀 상태
  DateTime? endDate;

  Bucket(this.content, this.isDone, this.pinState); // 생성자
}

// Memo 데이터는 모두 여기서 관리
class BucketService extends ChangeNotifier {
  List<Bucket> bucketList = [
    Bucket('job', false, false),
    Bucket('job2', false, false)
  ];

  createBucket({required String content}) {
    Bucket bucket = Bucket(content, false, false);
    bucketList.add(bucket);
    notifyListeners();
  }

  updateBucket({required int index, required String content}) {
    Bucket bucket = bucketList[index];
    bucket.content = content;
    notifyListeners();
  }

  updatePinState({required int index}) {
    Bucket bucket = bucketList[index];
    bucket.pinState = !bucket.pinState;
    notifyListeners();
  }

  int isDoneBucket() {
    int a = 0;
    for (int i = 0; i < bucketList.length; i++) {
      if (bucketList[i].isDone == true) {
        a++;
      }
    }
    return a;
  }
}
