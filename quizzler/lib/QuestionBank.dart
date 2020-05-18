import 'Question.dart';
class QuestionBank{
    List<Question> _QuestionList = [];
    int i = 0;
    QuestionBank(){
      _QuestionList.add(Question(q: "Dart is official language for Flutter." , a: true));
      _QuestionList.add(Question(q: "Dart  does'nt follows OOP's concept." , a: false));
      _QuestionList.add(Question(q: "Flutter is used to build only Android projects." , a: false));
      _QuestionList.add(Question(q: "Hot reload works on statefull widget." , a: true));
      _QuestionList.add(Question(q: "Flutter is a SDK." , a: true));
      _QuestionList.add(Question(q: "It is still in RELEASE PREVIEW." , a: false));
      _QuestionList.add(Question(q: "Quiz Finished !!" , a: false));

    }

    String getQuestion(){
      return _QuestionList[i].question;
    }
    bool getAnswer(){
      return _QuestionList[i].answer;
    }
    bool nextQuestion(){
      if(i<_QuestionList.length-1){
      i++;
      return true;
      }
      else{
        return false;
      }
    }
    int getLength(){
      return _QuestionList.length;
    }
}