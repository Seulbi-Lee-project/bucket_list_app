import 'package:flutter/material.dart';

import 'main.dart';

/// 버킷 클래스
class Bucket {
  String content; // 할 일
  bool isDone; // 완료 여부

  Bucket(this.content, this.isDone); // 생성자
}

// Memo 데이터는 모두 여기서 관리
class BucketService extends ChangeNotifier {
  List<Bucket> bucketList = [Bucket('job', false), Bucket('job2', false)];

  createBucket({required String content}) {
    Bucket bucket = Bucket(content, false);
    bucketList.add(bucket);
    notifyListeners();
  }

  updateBucket({required int index, required String content}) {
    Bucket bucket = bucketList[index];
    bucket.content = content;
    notifyListeners();
  }
}
