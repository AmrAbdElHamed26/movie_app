import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/watch_together_module/presentation/controller/watch_together_bloc.dart';
import 'package:flutter/services.dart';
import '../../../shared/services/services_locator.dart';

class WatchTogether extends StatefulWidget {
  const WatchTogether({Key? key}) : super(key: key);

  @override
  State<WatchTogether> createState() => _WatchTogetherState();
}

class _WatchTogetherState extends State<WatchTogether> {
  String roomId = " ";
  bool showDi = false;
  TextEditingController roomIdController = TextEditingController();
  String joinMeetingId = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void copyRoomIdToClipboard(BuildContext context, String roomId) {
    Clipboard.setData(ClipboardData(text: roomId));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Room ID copied to clipboard"),
      ),
    );
  }

  void showJoinRoomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text("Enter The Room ID"),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: roomIdController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Room ID';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Enter Room ID",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    joinMeetingId = roomIdController.text;
                    showDi = false;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              child: const Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showDi = false;
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  String generateRandomRoomID() {
    final random = Random();
    const characters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const roomIdLength = 8;
    String roomId = '';

    for (int i = 0; i < roomIdLength; i++) {
      final randomIndex = random.nextInt(characters.length);
      roomId += characters[randomIndex];
    }

    return roomId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WatchTogetherBloc>(),
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Lottie.asset('assets/images/animation_lmrshpbl.json'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            final randomRoomId = generateRandomRoomID();
                            roomId = randomRoomId;
                            setState(() {
                              roomIdController.text =
                                  ""; // Clear the text field
                            });
                            getIt<WatchTogetherBloc>()
                                .add(CreateRoomEvent(randomRoomId));
                          },
                          child: Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white38,
                            ),
                            child: const Center(
                              child: Text(
                                "Create Room",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            showDi = true;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white38,
                          ),
                          child: const Center(
                            child: Text(
                              "Join Room",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    // Add padding for spacing
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        copyRoomIdToClipboard(context, roomId);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "Room ID Is : $roomId",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white38,
                                ),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.copy,
                            size: 20,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              if (showDi == true)
                Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            showDi = false;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black.withOpacity(.9),
                        )),
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      title: const Text("Enter The Room ID"),
                      content: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: roomIdController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a Room ID';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Enter Room ID",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                joinMeetingId = roomIdController.text;
                                roomId = joinMeetingId;
                                showDi = false;
                              });
                              getIt<WatchTogetherBloc>()
                                  .add(CreateRoomEvent(joinMeetingId));
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showDi = false;
                            });
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
