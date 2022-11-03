/* This do file runs all project do files in order */


/* To initialize Stata environment,
desktop
cd "D:\Programs\Dropbox\github_repos\bdm_bic\analysis"
do do/settings.do

laptop
cd "C:\Users\sunch\Dropbox\github_repos\bdm_bic\analysis"
do do/settings.do
*/


/* to run this do file, type:
do ./do/mainscript.do
 */




cap log close _all

set more off


do ./do/settings.do



do ./do/clean/clean_prolific_demo.do

do ./do/clean/clean_qualtrics_data.do

do ./do/learn/explore.do

do ./do/share/prelim_figures.do

do ./do/share/sample_sum_stats.do
