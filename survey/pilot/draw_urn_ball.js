// randomly draw urn and balls twice with replacement from the selected urn in all scenarios

// declare an empty array for storing number of red urns
const nRedUrns = [];
// red balls in red urn in all scenarios
const nRedBallsRedUrn = [];

// array for the first draw of random numbers in all scenarios
const draw1RandNums = [];
// arrawy for the second draw of random numbers in all scenarios
const draw2RandNums = [];
// arrawy for the third draw of random numbers in all scenarios
const draw3RandNums = [];

// array for the color of the selected urn in all scenarios
const urnColors = [];
// color of the first and second ball
const ball1Colors = [];
const ball2Colors = [];

// number of scenarios
var numScenarios = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('num_scenarios'));


for (let i = 1; i <= numScenarios; i++) {
  nRedUrns[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_n_red_urn'));
  nRedBallsRedUrn[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_n_red_ball_red_urn'));

  // generate 3 random integeres from 1 to 10 inclusive for each scenario
  draw1RandNums[i - 1] = Math.floor(Math.random() * 10 + 1);
  draw2RandNums[i - 1] = Math.floor(Math.random() * 10 + 1);
  draw3RandNums[i - 1] = Math.floor(Math.random() * 10 + 1);

  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_rand_num_1', draw1RandNums[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_rand_num_2', draw2RandNums[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_rand_num_3', draw3RandNums[i -1]);


  // rule to determine the color of the selected urn
  if (draw1RandNums[i - 1] <= nRedUrns[i - 1]) {
    urnColors[i - 1] = "red";

    // rule to determine the color of the ball if selected urn is red
    if (draw2RandNums[i - 1] <= nRedBallsRedUrn[i - 1]) {
      ball1Colors[i - 1] = "red";
    } else {
      ball1Colors[i - 1] = "blue";
    }

    if (draw3RandNums[i - 1] <= nRedBallsRedUrn[i - 1]) {
      ball2Colors[i - 1] = "red";
    } else {
      ball2Colors[i - 1] = "blue";
    }
  } else {
    urnColors[i - 1] = "blue";

    // rule to determine the color of the ball if selected urn is blue
    // number of blue balls in blue urn = number of red balls in red urn
    if (draw2RandNums[i - 1] <= nRedBallsRedUrn[i - 1]) {
      ball1Colors[i - 1] = "blue";
    } else {
      ball1Colors[i - 1] = "red";
    }

    if (draw3RandNums[i - 1] <= nRedBallsRedUrn[i - 1]) {
      ball2Colors[i - 1] = "blue";
    } else {
      ball2Colors[i - 1] = "red";
    }
  }



  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_urn_color', urnColors[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_ball_1_color', ball1Colors[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_ball_2_color', ball2Colors[i -1]);

}
