import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_chat/firestore/chat_room.dart';
import 'package:infinite_scroll_chat/firestore/message.dart';
import 'package:infinite_scroll_chat/repositories/chat.dart';

import '../firestore/refs.dart';

class MockChatRepository implements BaseChatRepository {
  @override
  Future<QuerySnapshot<Message>> loadMoreMessagesQuerySnapshot({
    required int limit,
    required String chatRoomId,
    required QueryDocumentSnapshot<Message>? lastReadQueryDocumentSnapshot,
  }) =>
      _query(
        limit: limit,
        chatRoomId: chatRoomId,
        lastReadQueryDocumentSnapshot: lastReadQueryDocumentSnapshot,
      ).limit(limit).get();

  Query<Message> _query({
    required int limit,
    required String chatRoomId,
    required QueryDocumentSnapshot<Message>? lastReadQueryDocumentSnapshot,
  }) {
    var query = mockMessagesRef(chatRoomId: chatRoomId).orderBy('createdAt', descending: true);
    final qds = lastReadQueryDocumentSnapshot;
    if (qds != null) {
      query = query.startAfterDocument(qds);
    }
    return query.limit(limit);
  }

  @override
  Stream<List<ChatRoom>> subscribeChatRooms({
    Query<ChatRoom>? Function(Query<ChatRoom> query)? queryBuilder,
    int Function(ChatRoom lhs, ChatRoom rhs)? compare,
  }) {
    return Stream<List<ChatRoom>>.value([
      const ChatRoom(chatRoomId: 'chat-room-id-1'),
      const ChatRoom(chatRoomId: 'chat-room-id-2'),
      const ChatRoom(chatRoomId: 'chat-room-id-3'),
    ]);
  }

  @override
  Stream<List<Message>> subscribeMessages({
    required String chatRoomId,
    Query<Message>? Function(Query<Message> query)? queryBuilder,
    int Function(Message lhs, Message rhs)? compare,
  }) {
    return Stream<List<Message>>.value([
      const Message(content: 'メッセージ 1'),
      const Message(content: 'メッセージ 2'),
    ]);
  }
}
