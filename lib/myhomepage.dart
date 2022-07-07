import 'package:flutter/material.dart';
import 'package:quiz_app/question_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> questionlist = getQuestions();
  int currenindex = 0;
  int score = 0;
  Answer? selectAnswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Simple Quiz App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            _questionWidget(),
            _answerWidget(),
            _nextButton()
          ],
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question : ${currenindex + 1}/${questionlist.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            questionlist[currenindex].questionText,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  _answerWidget() {
    return Column(
      children: questionlist[currenindex]
          .answerList
          .map((e) => _answerButton(e))
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelexted = answer == selectAnswer;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(
          answer.answerText,
        ),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: isSelexted ? Colors.orangeAccent : Colors.white,
            onPrimary: isSelexted ? Colors.white : Colors.black),
        onPressed: () {
          if (selectAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
          }
          setState(() {
            selectAnswer = answer;
          });
        },
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currenindex == questionlist.length - 1) {
      isLastQuestion = true;
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text("Next"),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.blueAccent,
            onPrimary: Colors.white),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => _showscore());
          } else if (selectAnswer!.isCorrect == false) {
            showDialog(context: context, builder: (_) => _showscore());
          } else {
            setState(() {
              selectAnswer = null;
              currenindex++;
            });
          }
        },
      ),
    );
  }

  _showscore() {
    bool isPassed = false;
    if (score >= questionlist.length * 0.6) {
      isPassed = true;
    }
    String title = isPassed ? "Passed" : "Failed";
    return AlertDialog(
      title: Text(title + 'Score : ${score.toString()}'),
      content: ElevatedButton(
        child: Text("Restart"),
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            currenindex = 0;
            score = 0;
            selectAnswer = null;
          });
        },
      ),
    );
  }
}
