$(document).ready(function(){


  //question variables
  var questionNumber = 1;
  var userAnswer = [];
  var goodAnswer = [];
  var questionUsed = [];
  var nbQuestionToAnswer = 12; // don't forget to change the progress bar max value in html
  var nbAnswerNeeded = 10; // out of nbQuestionToAnswer
  var nbPossibleQuestions = 24; //number of questions in database questions.js

  function getRandomQuestion() {
    var continuer = true;
    var random;
    while (continuer){
      continuer=false; // do not continue loop
      random = Math.floor(Math.random() * nbPossibleQuestions) ; // number of possible questions
      if(questionNumber==1){
        return random;
      }
      for(i=0; i<questionNumber-1; i++){
        if (random == questionUsed[i]) {
          continuer=true; // continue loop only if random is already used
        }
      }
    }
    questionUsed.push(random);
    return random;
  }


  // Partial Functions
  function closeMain() {
    $(".home").css("display", "none");
  }
  function openMain() {
    $(".home").css("display", "block");
  }
  function closeAll() {
    $(".body").css("display", "none");

  }
  function openQuestionnaire() {
    $(".questionnaire-container").css("display", "block");
    var randomQuestion = getRandomQuestion();
    $("#questionNumero").html("Pregunta : " + questionNumber);
    $("#question").html(tableauQuestion[randomQuestion].question);
    $(".answerA").html(tableauQuestion[randomQuestion].propositionA);
    $(".answerB").html(tableauQuestion[randomQuestion].propositionB);
    $(".answerC").html(tableauQuestion[randomQuestion].propositionC);

    $('input[name=question]').attr('checked',false);
    goodAnswer.push(tableauQuestion[randomQuestion].reponse);
    $(".questionnaire-container .progression").val(questionNumber-1);
  }
  function openResultGood() {
    $(".resultGood").css("display", "block");
    questionUsed = [];
    goodAnswer = [];
    userAnswer = [];
    questionNumber = 1;
  }
  function openResultBad() {
    $(".resultBad").css("display", "block");
    questionUsed = [];
    goodAnswer = [];
    userAnswer = [];
    questionNumber = 1;
  }
  function openContainer() {
    $(".question-container").css("display", "block");
    $("#cursor").css("display", "block");
  }
  function closeContainer() {
    $(".question-container").css("display", "none");
    $("#cursor").css("display", "none");
  }
  
  // Listen for NUI Events
  window.addEventListener('message', function(event){
    var item = event.data;
    // Open & Close main gang window
    if(item.openQuestion == true) {
      openContainer();
      openMain();
    }
    if(item.openQuestion == false) {
      closeContainer();
      closeMain();
    }
    // Open sub-windows / partials
    if(item.openSection == "question") {
      closeAll();
      openQuestionnaire();
    }

  });


  // Handle Button Presses
  $(".btnQuestion").click(function(){
      $.post('http://chaini_test/question', JSON.stringify({}));
  });
  $(".btnClose").click(function(){
      $.post('http://chaini_test/close', JSON.stringify({}));
  });
  $(".btnKick").click(function(){
      $.post('http://chaini_test/kick', JSON.stringify({}));
  });
 

 // Handle Form Submits
  $("#question-form").submit(function(e) {
    e.preventDefault();
    if(questionNumber!=nbQuestionToAnswer){
      //question 1 to 9 : pushing answer in array
      closeAll();
      userAnswer.push($('input[name="question"]:checked').val());
      questionNumber++;
      openQuestionnaire();
    }
    else {
      // question 10 : comparing arrays and sending number of good answers
      userAnswer.push($('input[name="question"]:checked').val());
      var nbGoodAnswer = 0;
      for (i = 0; i < nbQuestionToAnswer; i++) {
        if (userAnswer[i] == goodAnswer[i]) {
          nbGoodAnswer++;
        }
      }
      closeAll();
      if(nbGoodAnswer >= nbAnswerNeeded) {
        openResultGood();
      }
      else{
        openResultBad();
      }
    }
    $('input[name="question"]' ).prop( "checked", false );
  });
});
