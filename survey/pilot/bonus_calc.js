// calculate bonus earnings.
// First written by Christina Sun on September 28, 2022

// array for the color of the selected urn in all scenarios
const urnColors = [];
// color of the first and second ball
const ball1Colors = [];
const ball2Colors = [];

// arrays for guesses in questions 1-3 in each scenario
const q1Guesses = [];
const q2Guesses = [];
const q3Guesses = [];

// random numbers
const q1RandNum1 = [];
const q1RandNum2 = [];

const q2RandNum1 = [];
const q2RandNum2 = [];

const q3RandNum1 = [];
const q3RandNum2 = [];

// payment methods in all scenarios
const q1PayMethods = [];
const q2PayMethods = [];
const q3PayMethods = [];

// bonus earnings in all scenarios
const q1Bonus = [];
const q2Bonus = [];
const q3Bonus = [];

// bonus per question
var bonusPerQ = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('bonus_per_q'));


for (let i = 1; i <= 11; i++) {
  urnColors[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_urn_color'));
  ball1Colors[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_ball_1_color'));
  ball2Colors[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_ball_2_color'));

  q1Guesses[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_guess_1'));
  q2Guesses[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_guess_2'));
  q3Guesses[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_guess_3'));

  // random number between 1 and 100 inclusive
  q1RandNum1[i - 1] = Math.floor(Math.random() * 100 + 1);
  q1RandNum1[i - 1] = Math.floor(Math.random() * 100 + 1);

  q2RandNum1[i - 1] = Math.floor(Math.random() * 100 + 1);
  q2RandNum1[i - 1] = Math.floor(Math.random() * 100 + 1);

  q3RandNum1[i - 1] = Math.floor(Math.random() * 100 + 1);
  q3RandNum1[i - 1] = Math.floor(Math.random() * 100 + 1);

  // question 1 payment: if random number 1 <= guess, use payment on event
  if (q1RandNum1[i - 1] <= q1Guesses[i - 1]) {
    q1PayMethods[i - 1] = "event";
    // if selected urn is red, earn bonus
    if (urnColors[i - 1] == "red") {
      q1Bonus[i - 1] = bonusPerQ;
    } else {
      q1Bonus[i - 1] = 0;
    }
  } else {
    // if random number 1 > guess, payment on lottery
    q1PayMethods[i - 1] = "lottery";
    // if random number 2 <= random number 1, earn bonus
    if (q1RandNum2[i - 1] <= q1RandNum1[i - 1]) {
      q1Bonus[i - 1] = bonusPerQ;
    } else {
      q1Bonus[i - 1] = 0;
    }
  }

  // question 2 payment: if random number 1 <= guess, use payment on event
  if (q2RandNum1[i - 1] <= q2Guesses[i - 1]) {
    q2PayMethods[i - 1] = "event";
    // if selected urn is red, earn bonus
    if (ball1Colors[i - 1] == "red") {
      q2Bonus[i - 1] = bonusPerQ;
    } else {
      q2Bonus[i - 1] = 0;
    }
  } else {
    // if random number 1 > guess, payment on lottery
    q2PayMethods[i - 1] = "lottery";
    // if random number 2 <= random number 1, earn bonus
    if (q2RandNum2[i - 1] <= q2RandNum1[i - 1]) {
      q2Bonus[i - 1] = bonusPerQ;
    } else {
      q2Bonus[i - 1] = 0;
    }
  }

  // question 3 payment: if random number 1 <= guess, use payment on event
  if (q3RandNum1[i - 1] <= q3Guesses[i - 1]) {
    q3PayMethods[i - 1] = "event";
    // if selected urn is red, earn bonus
    if (ball2Colors[i - 1] == "red") {
      q3Bonus[i - 1] = bonusPerQ;
    } else {
      q3Bonus[i - 1] = 0;
    }
  } else {
    // if random number 1 > guess, payment on lottery
    q3PayMethods[i - 1] = "lottery";
    // if random number 2 <= random number 1, earn bonus
    if (q3RandNum2[i - 1] <= q3RandNum1[i - 1]) {
      q3Bonus[i - 1] = bonusPerQ;
    } else {
      q3Bonus[i - 1] = 0;
    }
  }

  // set embedded data for bonus and payment methods
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_q_1_bonus', q1Bonus[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_q_2_bonus', q2Bonus[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_q_3_bonus', q3Bonus[i -1]);

  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_q_1_pay_method', q1PayMethods[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_q_2_pay_method', q2PayMethods[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_q_3_pay_method', q3PayMethods[i -1]);

  // add embedded data for random numbers
  Qualtrics.SurveyEngine.addEmbeddedData('sce_' + i + '_q_1_rand_num_1', q1RandNum1[i -1]);
  Qualtrics.SurveyEngine.addEmbeddedData('sce_' + i + '_q_1_rand_num_2', q1RandNum2[i -1]);

  Qualtrics.SurveyEngine.addEmbeddedData('sce_' + i + '_q_2_rand_num_1', q2RandNum1[i -1]);
  Qualtrics.SurveyEngine.addEmbeddedData('sce_' + i + '_q_2_rand_num_2', q2RandNum2[i -1]);

  Qualtrics.SurveyEngine.addEmbeddedData('sce_' + i + '_q_3_rand_num_1', q3RandNum1[i -1]);
  Qualtrics.SurveyEngine.addEmbeddedData('sce_' + i + '_q_3_rand_num_2', q3RandNum2[i -1]);
}


// need to test code and test whether qualtrics saves embedded data from .addEmbeddedData function 