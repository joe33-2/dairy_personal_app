import 'package:flutter/material.dart';
import 'note.dart';
import 'package:intl/intl.dart';
import 'dart:ui'; // For BackdropFilter

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<Map<String, String>> savedNotes = [];

  void _addOrEditNote({Map<String, String>? existingNote, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteScreen(
          title: existingNote?['title'] ?? '',
          content: existingNote?['content'] ?? '',
        ),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        if (index != null) {
          savedNotes[index] = result; 
        } else {
          savedNotes.add(result);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('MM/dd/yyyy').format(DateTime.now());

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditNote(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/br.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Optional light overlay
          Container(color: Colors.grey.withOpacity(0.1)),

          // Main content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Diary & Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Diary',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // white text
                      ),
                    ),
                    Text(
                      todayDate,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // white text
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Frosted notes container
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: savedNotes.isEmpty
                            ? const Center(
                                child: Text(
                                  'No notes yet',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children:
                                      savedNotes.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    Map<String, String> note = entry.value;

                                    return GestureDetector(
                                      onTap: () => _addOrEditNote(
                                        existingNote: note,
                                        index: index,
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 12),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.white.withOpacity(0.4),
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                note['title'] ?? '',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  savedNotes.removeAt(index);
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                      ),
                    ),
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
