import 'package:quiz_covid/Q&A/questionmodel.dart';

List<QuestionModel> getQuestions() {
  List<QuestionModel> questions = new List<QuestionModel>();
  QuestionModel questionModel = new QuestionModel();

  //1

  questionModel.setQuestion("Beber água ajuda a matar vírus no estômago.");
  questionModel.setAnswer(false);
  questionModel.setReAnswer(
      "“O papel da água na luta contra a Covid-19 é, sim, na higiene! Lavar, lavar e lavar de novo as mãos é o que pode prevenir a doença. Não existe contaminação ‘pelo estômago’. A contaminação é pelas mucosas: olhos, nariz e boca”, esclarece.");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //2

  questionModel.setQuestion(
      "O Covid-19 afeta simplesmente pessoas idosas e com doenças crónicas.");
  questionModel.setAnswer(false);
  questionModel.setReAnswer(
      "O Covid-19 afeta pessoas de todas as idades, sem excepção, mas é bem verdade que pessoas idosas e com doenças crónicas pertencem ao grupo de risco.");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //3

  questionModel.setQuestion(
      "Luvas e máscaras nos protegem contra a transmissão do COVID-19.");
  questionModel.setAnswer(true);
  questionModel.setReAnswer(
      "A máscara protege contra a doença, mas não a evita. Existem outras formas de contrair o Coronavírus mesmo estando de máscara. A principal forma de contágio é através do ar, quando a pessoa contaminada tosse ou espirra, espalhando o vírus");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //4

  questionModel
      .setQuestion("Suster o ar ajuda a testar se tem o novo coronavírus.");
  questionModel.setAnswer(false);
  questionModel.setReAnswer(
      "Não existe qualquer evidência ou base científica a favor desse autoteste. Os únicos testes que podem confirmar o diagnóstico de infeção Covid-19 são de cariz laboratorial.");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //5

  questionModel.setQuestion(
      "Angola possui mais de 5 casos de pessoas recuperadas do COVID-19.");
  questionModel.setAnswer(true);
  questionModel.setReAnswer(
      "Até a data Angola já obteve um número superior a 5 casos de pessoas recuperadas da doença.");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //6

  questionModel
      .setQuestion("Os sintomas do COVID-19 são iguais a uma gripe comum.");
  questionModel.setAnswer(true);
  questionModel.setReAnswer(
      "Em caso de febre, tosse e dificuldade para respirar, é preciso ficar alerta. Em alguns casos, também há complicações respiratórias, podendo evoluir para pneumonias.");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //7

  questionModel.setQuestion(
      "A distância mínima a que devo estar de outra pessoa, para não ser infetado pelo COVID-19 é de 30cm.");
  questionModel.setAnswer(false);
  questionModel
      .setReAnswer("A distância mínima que devemos estar é de 2 metros");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //8

  questionModel.setQuestion(
      "Existe um exame capaz de detectar a existência do Coronavírus no corpo humano.");
  questionModel.setAnswer(true);
  questionModel.setReAnswer(
      "Sim, existe um exame laboratorial capaz de detetar o vírus no nosso corpo.");
  questions.add(questionModel);
  questionModel = new QuestionModel();
  //9

  questionModel.setQuestion(
      "Animais domesticos como cães e gatos podem transmitir o vírus.");
  questionModel.setAnswer(false);
  questionModel.setReAnswer(
      "Não há evidências de que animais domésticos podem ser via de transmissão do Coronavírus, mas se recomenda sempre lavar as mãos após brincar com os mesmos.");
  questions.add(questionModel);
  questionModel = new QuestionModel();

//10

  questionModel.setQuestion(
      "O tempo entre a exposição ao vírus do COVID-19 e os primeiros sintomas é de 30 dias.");
  questionModel.setAnswer(false);
  questionModel.setReAnswer(
      "Os primeiros estudos dizem que é cerca de 2-14 dias úteis.");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //11

  questionModel.setQuestion(
      "Não existe um medicamento para a COVID-19, por isso as pessoas não se curam.");
  questionModel.setAnswer(false);
  questionModel.setReAnswer(
      "Apesar de não haver medicamentos para o vírus e só se tratarem os sintomas, muitos dos doentes infetados ficam curados em poucas semanas.");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //12

  questionModel.setQuestion(
      "Basta lavar as mãos com água que os microorganimos contidos nela serão eliminados.");
  questionModel.setAnswer(false);
  questionModel.setReAnswer(
      "Devemos lavar as mãos frequentemente com água e sabão ou produtos com base alcoólica");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //13

  questionModel.setQuestion(
      "O Covid-19 pode infetar pessoas de todas as nacionalidades.");
  questionModel.setAnswer(true);
  questionModel.setReAnswer(
      "Embora os primeiros casos tenham aparecido na China, o vírus atinge de igual forma qualquer pessoa, de qualquer país.");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //14

  questionModel.setQuestion(
      "Lavar as mãos frequentemente é uma prática que nos ajuda a proteger contra a COVID-19 e outras doenças ou microrganismos");
  questionModel.setAnswer(true);
  questionModel.setReAnswer(
      "As mãos são um dos principais meios de transmissão dos vírus e bactérias.");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  //15

  questionModel.setQuestion(
      "Se sentir sintomas associados à COVID-19, como febre e tosse, devo ficar em casa em «isolamento social» e ligar para o CISP no terminal 111");
  questionModel.setAnswer(true);
  questionModel.setReAnswer(
      "Devemos ligar para o CISP, para que nos indiquem o que devemos fazer.");
  questions.add(questionModel);
  questionModel = new QuestionModel();

  return questions;
}
