 // var testvar =  Qualtrics.SurveyEngine.getEmbeddedData('sce_'+ 1 + '_n_red_urn');

// var testvar2 = testvar + 1
const testvar = [];
for (let i = 1; i < 11; i++) {
  testvar[i - 1] = parseInt(Qualtrics.SurveyEngine.getEmbeddedData('sce_'+ i + '_n_red_urn'));
}
  const testArray =  testvar.map(n => 10 - n);
  let k = 2
  Qualtrics.SurveyEngine.setEmbeddedData('sce_' + k + '_n_blue_urn', testArray[0]);
