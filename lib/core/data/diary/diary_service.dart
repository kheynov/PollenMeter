import 'package:firebase_auth/firebase_auth.dart';
import 'package:pollen_meter/core/data/diary/local/local_diary_data_source.dart';
import 'package:pollen_meter/core/data/diary/remote/firebase_diary_data_source.dart';
import 'package:pollen_meter/core/domain/diary/models/diary_model.dart';

class DiaryService {
  final LocalDiaryDataStore localRepository;
  final FirebaseDiaryDataStore remoteRepository;

  final FirebaseAuth auth = FirebaseAuth.instance;

  DiaryService(this.localRepository, this.remoteRepository);

  Future<void> syncFromRemoteRepository() async {
    assert(auth.currentUser != null);
    await remoteRepository.getDiaries().then(
          (diaries) => diaries.map(
            (diary) => localRepository.saveDiary(diary),
          ),
        );
  }

  Future<void> syncToRemoteRepository() async {
    assert(auth.currentUser != null);
    await localRepository.getDiaries().then(
          (diaries) => diaries.map(
            (diary) => remoteRepository.saveDiary(diary),
          ),
        );
  }

  Future<List<DiaryModel>> getDiaries() async {
    return await localRepository.getDiaries();
  }

  Future<void> saveDiary(DiaryModel diary) async {
    await localRepository.saveDiary(diary);
    if (auth.currentUser != null) {
      await remoteRepository.saveDiary(diary);
    }
  }
}
