import 'package:chat/models/ChatMessage.dart';
import 'package:chat/screens/messages/componants/text_message.dart';
import 'package:chat/screens/messages/componants/video_messages.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'audio_message.dart';

class Messages extends StatelessWidget {
  const Messages({
    Key key,
    @required this.messages,
  }) : super(key: key);
  final ChatMessage messages;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: messages);

          break;
        case ChatMessageType.audio:
          return AudioMessage(message: messages);
          break;

        case ChatMessageType.video:
          return VideoMessage();
          break;

        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            messages.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!messages.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            )
          ],
          SizedBox(
            width: kDefaultPadding / 2,
          ),
          messageContaint(messages),
          if (messages.isSender)
            MessageStatusDot(
              status: messages.messageStatus,
            )
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;

  const MessageStatusDot({Key key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
          break;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1.color.withOpacity(0.1);
          break;
        case MessageStatus.viewed:
          return kPrimaryColor;
          break;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration:
          BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
      child: Icon(status == MessageStatus.not_sent ? Icons.close : Icons.done,
          size: 8, color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
