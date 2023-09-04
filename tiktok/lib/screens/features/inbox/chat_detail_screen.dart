import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});
  final bool isIphone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: isIphone ? true : false,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(Sizes.size4),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                      "https://cdn.newspenguin.com/news/photo/202010/3276_9692_1455.jpg"),
                  radius: Sizes.size20,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: Sizes.size18,
                  height: Sizes.size18,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size3,
                    ),
                    borderRadius: BorderRadius.circular(Sizes.size24),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            "뚱냥",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            "Active Now",
            style:
                TextStyle(fontSize: Sizes.size12, fontWeight: FontWeight.w400),
          ),
        ),
        actions: const [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h24,
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.separated(
                reverse: true,
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size20,
                  horizontal: Sizes.size14,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.size14),
                        decoration: BoxDecoration(
                          color: !isMine
                              ? Theme.of(context).primaryColor
                              : Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(
                              Sizes.size12,
                            ),
                            topRight: const Radius.circular(
                              Sizes.size12,
                            ),
                            bottomLeft: isMine
                                ? const Radius.circular(
                                    Sizes.size12,
                                  )
                                : Radius.zero,
                            bottomRight: isMine
                                ? Radius.zero
                                : const Radius.circular(
                                    Sizes.size12,
                                  ),
                          ),
                        ),
                        child: const Text(
                          "Message",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 12),
          ),
          BottomAppBar(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size8, horizontal: Sizes.size16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Send a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          Sizes.size16,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.faceLaugh,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                ),
                Gaps.h16,
                Container(
                  padding: const EdgeInsets.all(Sizes.size8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade400,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.solidPaperPlane,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
