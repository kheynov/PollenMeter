import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pollen_meter/core/data/diary/remote/dto/firebase_diary_dto.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';
import 'package:pollen_meter/core/domain/diary/repository/diary_repository.dart';
import 'package:pollen_meter/core/utils/logger.dart';

class FirebaseDiaryDataStore implements DiaryDataStore {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore firestore;

  late final CollectionReference<FirebaseDiaryDto> collection;

  FirebaseDiaryDataStore(this.firestore, this.collection) {
    collection =
        firestore.collection('diaries').withConverter<FirebaseDiaryDto>(
              fromFirestore: (snapshot, _) =>
                  FirebaseDiaryDto.fromJson(snapshot.data()!),
              toFirestore: (dto, _) => dto.toJson(),
            );
  }

  bool checkUserAuthorized() => firebaseAuth.currentUser != null;

  Future<bool> checkIfUserDiaryExists() async {
    assert(checkUserAuthorized());
    return await collection
        .where('uid', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.docs.isNotEmpty);
  }

  Future<void> createUserDiary(DiaryModel initialData) async {
    assert(checkUserAuthorized());
    return saveDiary(initialData);
  }

  @override
  Future<List<DiaryModel>> getDiaries() async {
    assert(checkUserAuthorized());
    return await collection
        .where('uid', isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.docs.map((e) => e.data().data).toList());
  }

  @override
  Future<void> saveDiary(DiaryModel diary) async {
    assert(checkUserAuthorized());
    try {
      final doc = await collection
          .where('uid', isEqualTo: firebaseAuth.currentUser!.uid)
          .get()
          .then((value) => value.docs[0]);
      collection.doc(doc.id).delete();
    } catch (e) {
      Logger.log('Умные мысли');
    }
    collection
        .add(FirebaseDiaryDto(data: diary, uid: firebaseAuth.currentUser!.uid));
  }
}
