import 'package:flutter_test/flutter_test.dart';
import 'package:princess_diaries/data/data_source/post_db.dart';
import 'package:princess_diaries/domain/model/post.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test', () async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE post (id INTEGER PRIMARY KEY AUTOINCREMENT, emoji TEXT, date INTEGER, content TEXT)');
    // table 생성 테스트
    expect(db.isOpen, true);

    final postDb = PostDb(db);
    await postDb.insertPost(Post(
      id: 1,
      emoji: 'test1',
      date: DateTime.now(),
      content: 'test1',
    ));
    // insert 테스트
    expect((await postDb.getPosts()).length, 1);

    Post post = (await postDb.getPostById(1))!;
    // getPostById 테스트
    expect(post.id, 1);

    await postDb.updateNote(post.copyWith(
      content: 'change',
    ));
    post = (await postDb.getPostById(1))!;
    // update 테스트
    expect(post.content, 'change');

    await postDb.deletePost(post);
    expect((await postDb.getPosts()).length, 0);

    await db.close();
  });
}
