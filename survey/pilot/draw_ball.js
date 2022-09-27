// randomly draw a ball twice with replacement from the selected urn

// declare an empty array for storing number of red urns
const nRedUrns = [];
// red balls in red urn in all scenarios
const nRedBallsRedUrn = [];

// array for the first draw of random numbers in all scenarios
const draw1RandNums = [];
// arrawy for the second draw of random numbers in all scenarios
const draw2RandNums = [];

for (let i = 1; i <= 11; i++) {
  nRedUrns[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_n_red_urn'));
  nRedBallsRedUrn[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_n_red_ball_red_urn'));

  // generate 2 random integeres from 1 to 10 inclusive for each scenario
  draw1RandNums[i -1] = Math.floor(Math.random() * 10 + 1)
  draw2RandNums[i -1] = Math.floor(Math.random() * 10 + 1)

  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_rand_num_1', draw1RandNums[i -1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_rand_num_2', draw2RandNums[i -1]);

}

// note: next is to test color of the ball
