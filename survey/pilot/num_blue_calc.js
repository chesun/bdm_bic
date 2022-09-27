// calculate the number of blue jars and the number of blue balls in each jar in each scenario

// declare an empty array for storing number of red urns
const nRedUrns = [];
// red balls in red urn in all scenarios
const nRedBallsRedUrn = [];

// load embedded data
for (let i = 1; i <= 11; i++) {
  nRedUrns[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_n_red_urn'));
  nRedBallsRedUrn[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_' + i + '_n_red_ball_red_urn'));
}


// number of blue urns in all scenarios
const nBlueUrns = nRedUrns.map(n => 10 - n);
// number of blue balls in red urn in all scenarios
const nBlueBallsRedUrn = nRedBallsRedUrn.map(n => 10 - n);

// set embedded data
for (let i = 1; i <= 11; i++) {
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_n_blue_urn', nBlueUrns[i - 1]);
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + i + '_n_blue_ball_red_urn', nBlueBallsRedUrn[i - 1]);
}
