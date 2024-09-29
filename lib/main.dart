import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});
  @override
  State<QuizApp> createState()=> _QuizAppState();
}
class _QuizAppState extends State<QuizApp>{
  List<Map>allQuestions=[
    {
      "Question":"Who is founder of Microsoft?",
      "options": ["Steve jobs","Bill Gates","Lary Page","Elon musk"],
      "correctAnswer":1
    },
    {
      "Question":"Who is founder of Google?",
      "options": ["Steve jobs","Bill Gates","Lary Page","Elon musk"],
      "correctAnswer":2
    },
    {
      "Question":"Who is founder of SpaceX?",
      "options": ["Steve jobs","Bill Gates","Lary Page","Elon musk"],
      "correctAnswer":3
    },
    {
      "Question":"Who is founder of Apple?",
      "options": ["Steve jobs","Bill Gates","Lary Page","Elon musk"],
      "correctAnswer":0
    },
    {
      "Question":"Who is founder of Meta?",
      "options": ["Steve jobs","Mark Zuckerberg","Lary Page","Elon musk"],
      "correctAnswer":1
    },
  ];
  int currentQuestionIndex=0;
  int selectedAnswerIndex=-1;
  bool questionPage=true;
  int score=0;
  WidgetStateProperty<Color?> checkAnswer(int answerIndex){
    if(selectedAnswerIndex!=-1){
      if(answerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
      return const WidgetStatePropertyAll(Colors.green);}
      else if(answerIndex==selectedAnswerIndex){
              return const WidgetStatePropertyAll(Colors.red);
      }else{
        return const WidgetStatePropertyAll(null);
      }
    }else{
          return const WidgetStatePropertyAll(null);
    }
  }
  
@override  
Widget build(BuildContext context){
  if(questionPage){
  
   return Scaffold(
    appBar: AppBar( 
      title: const Text("QUIZ APP",
                       style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 22, 7, 82),
                       ),
                       ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 73, 156, 212),
    ),
    body:Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row( 
          children: [
            const SizedBox(
              width: 130,
            ),
            Text("Question:${currentQuestionIndex+1}/${allQuestions.length}",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color:Color.fromARGB(255, 125, 16, 130),
            ),
            )
          ],
        ),
        const SizedBox(
          height:50,
        ),
        SizedBox(
          height: 60,
          width: 400,
          child: Text(
            allQuestions[currentQuestionIndex]["Question"],
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color:Color.fromARGB(255, 14, 4, 111),
            ),
          
          ),
        ),
         const SizedBox(
          height:20,
        ),
        SizedBox(
          height: 60,
          width: 400,
          child: ElevatedButton(
          style:ButtonStyle(
            backgroundColor: checkAnswer(0),
          ),
            onPressed:(){
              if(selectedAnswerIndex==-1){
              selectedAnswerIndex=0;
              setState(() { });
              }
            },
            child: Text("A.${allQuestions[currentQuestionIndex]['options'][0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color:Colors.black,
                  ),
                   ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         SizedBox(
          height: 60,
          width: 400,
          child: ElevatedButton(
            
          style:ButtonStyle(
            backgroundColor: checkAnswer(1),
          ),
             onPressed:(){
               if(selectedAnswerIndex==-1){
               selectedAnswerIndex=1;
              setState(() { });
               }
            },
            child: Text("B.${allQuestions[currentQuestionIndex]['options'][1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color:Colors.black,
                  ),
                   ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         SizedBox(
          height: 60,
          width: 400,
          child: ElevatedButton(
               
          style:ButtonStyle(
            backgroundColor: checkAnswer(2),
          ),
             onPressed:(){
               if(selectedAnswerIndex==-1){
               selectedAnswerIndex=2;
              setState(() { });
               }
            },
            child: Text("C.${allQuestions[currentQuestionIndex]['options'][2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color:Colors.black,
                  ),
                   ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         SizedBox(
          height: 60,
          width: 400,
          child: ElevatedButton(
            
          style:ButtonStyle(
            backgroundColor: checkAnswer(3),
          ),
            onPressed:(){
               if(selectedAnswerIndex==-1){
              selectedAnswerIndex=3;
              setState(() { });
               }
            },
            
            child: Text("D.${allQuestions[currentQuestionIndex]['options'][3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color:Colors.black,
                  ),
                  
                  
                   ),
                   
                   
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        
      ],
    ),
    
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        if(selectedAnswerIndex!=-1){
          if(selectedAnswerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
            score++;
          }
        if(currentQuestionIndex<allQuestions.length-1){
          currentQuestionIndex++;
          selectedAnswerIndex=-1;
          
        }
        else{
           questionPage=false;
        }
        setState(() {});
        }
      },
    
      backgroundColor: Color.fromARGB(255, 228, 52, 160),
      child: const Icon(Icons.forward,
      color: Colors.white,
    ),
  ),
   );
  }
  else{
    return Scaffold(
     appBar: AppBar( 
      title: const Text("QUIZ RESULT",
                       style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.pink,
                       ),
                       ),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 46, 161, 214),
    ),
    body: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [ 
            const SizedBox(
          width: 110,
        ),
            
            SizedBox(
          height: 300,
          width: 200,
          child: Image.network("https://tse4.mm.bing.net/th?id=OIP.MImHkjBUYvZvDjP0YlcAmQHaF1&pid=Api&P=0&h=220"),
        ),
          ],
        ),
        const Row(
          children: [ 
             SizedBox(
          width: 100,
        ),
            
            SizedBox(
          height: 50,
          width: 250,
          child:Text("Congratulations!!!!!",
          style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 69, 208, 208)
          ),
          ),
        ),
          ],
        ),
        const SizedBox(
         height: 50,
        ),
         Row(
          children: [ 
            const SizedBox(
          width: 110,
        ),
            
            SizedBox(
          height: 50,
          width: 300,
          child:Text("Your Score:$score/${allQuestions.length}",
          style:const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
          ),
          ),
        ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
          Row(
          children: [ 
            const  SizedBox(
          width: 76,
        ),
            
            SizedBox(
          height: 50,
          width: 300,
          child: ElevatedButton(
            onPressed: (){
              questionPage=true;
              selectedAnswerIndex=-1;
              currentQuestionIndex=0;
              score=0;
              setState(() {});
            },
            child:const Text("RETAKE QUIZ",
          style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 203, 39, 176)
          ),
          ),),
        ),
      ],
      
    ),
      ],
    ),
    );
  }
}
}