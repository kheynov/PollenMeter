import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pollen_meter/core/data/profile/remote/dto/firebase_profile_dto.dart';
import 'package:pollen_meter/core/domain/profile/model/profile_data_model.dart';

class FirebaseProfileDataStore {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final CollectionReference<FirebaseProfileDto> collection;

  FirebaseProfileDataStore() {
    collection =
        firestore.collection('profiles').withConverter<FirebaseProfileDto>(
              fromFirestore: (snapshot, _) =>
                  FirebaseProfileDto.fromJson(snapshot.data()!),
              toFirestore: (dto, _) => dto.toJson(),
            );
  }

  bool checkUserAuthorized() {
    return firebaseAuth.currentUser != null;
  }

  Future<void> createUser(ProfileDataModel initialData) {
    assert(checkUserAuthorized());
    return saveProfile(initialData, firebaseAuth.currentUser!.uid);
  }

  Future<ProfileDataModel> getProfile(String uid) async {
    assert(checkUserAuthorized());
    return await collection
        .where('uid', isEqualTo: uid)
        .get()
        .then((snapshot) => snapshot.docs[0].data().data);
  }

  Future<void> saveProfile(ProfileDataModel profile, String uid) async {
    final doc = await collection
        .where('uid', isEqualTo: uid)
        .get()
        .then((value) => value.docs[0]);
    collection.doc(doc.id).update(profile.toJson());
  }
}
