{smcl}
{*  02-06-2015}
{hline}
help for {hi:prody}
{hline}

{title:Calculation of factor intensity and sophistication indicators such as the PRODY index by Hausmann et {it:al.} (2007).}

{p 8 17 2}
{cmd:prody}
[{cmd:if} {it:exp}] [{cmd:in} {it:range}] {cmd:using} {it:filename} {cmd:, } 
{cmd:{ul:tr}ade(}{it:varname}{cmd:)} {cmd:gdp(}{it:varname}{cmd:)} {cmd:id(}{it:varname}{cmd:)}
{cmd:{ul:prod}uct(}{it:varname}{cmd:)} [{cmd:{ul:t}ime(}{it:varname}{cmd:)} 
{cmd:{ul:ver}sion(}{it:version_options}{cmd:)} {cmd:{ul:bal}ance(}{it:balance_options}{cmd:)} 
{cmd:sample(}{it:sample_file}{cmd:)} {cmd:replace}]

{title:Related}

{p 4 4 2}
{help expy:expy} {hline 2} Calculation of the EXPY index as proposed by Hausmann et {it:al.} (2007)


{title:Description}

{p 4 4 2}
{cmd:prody} allows to calculate variations of factor intensity and sophistication indicators such as the PRODY index, which was proposed by Hausmann et {it:al.} (2007).  
The procedure is based on unilateral and disaggregated trade data and a country-specific indicator, like the GDP per capita. Data can be either a cross-section or a panel. 
The result is stored in an external file which is specified by {cmd: using} {it:filename}. For a more detailed description we refer to Huber (2016).

{title:Options}

{p 4 7 2}
{cmd:{ul:tr}ade(}{it:varname}{cmd:)} specifies the variable containing unilateral disaggregated trade flows.

{p 4 7 2}
{cmd:gdp(}{it:varname}{cmd:)} specifies any type of country specific indicator, for example the GDP per capita.

{p 4 7 2}
{cmd:id(}{it:varname}{cmd:)} specifies the variable that identifies the countries.

{p 4 7 2}
{cmd:{ul:prod}uct(}{it:varname}{cmd:)} specifies the trade classification.

{p 4 7 2}
{cmd:{ul:t}ime(}{it:varname}{cmd:)} specifies the time variable - must be specified in case of a panel data set.

{p 4 7 2}
{cmd:{ul:ver}sion(}{it:version_options}{cmd:)} specifies the version(s) that should be calculated, where {it: version_options} is one or more of the following:

{p 9 12 2}
{cmd:timevarying}: takes the timevarying {cmd:trade} and the timevarying {cmd:gdp} information for calculation.

{p 9 12 2}
{cmd:mean1}: takes the average of {cmd:gdp} and {cmd:trade} over {cmd:time}.

{p 9 12 2}
{cmd:mean2}: takes the average of the {cmd:timevarying} PRODY over time. This version has been used by Hausmann et {it:al.}(2007) in their cross-section.

{p 9 12 2}
{cmd:meangdp}: takes the average of {cmd:gdp} over time and the timevarying {cmd:trade} information for calculation.

{p 9 12 2}
{cmd:meantrade}: takes the timevarying {cmd:gdp} and the average of {cmd:trade} over time for calculation.

{p 9 12 2}
{cmd:lall}: takes the timevarying {cmd:gdp} and {cmd:trade} information for calculation, whereby countries are grouped into ten income groups as proposed by Lall  et {it:al.}(2006).

{p 9 12 2}
{cmd:mic1}: takes the timevarying {cmd:gdp} and {cmd:trade} information for calculation of the Michaely (1984) index with simple trade share as weights.

{p 9 12 2}
{cmd:mic2}: takes the average of {cmd:gdp} and {cmd:trade} over time for calculation of the alternative Michaely (1984) index, which takes the estimated coefficient of a simple linear regression of the country's trade share on their {cmd:gdp}.

{p 9 12 2}
In case {cmd:version()} is not specified, all variations are calculated. Due to the fact of the versions timevarying, mean1, mean2, meangdp, and meantrade being identical in a cross-section, we only report the mean1 indicator.

{p 4 7 2}
{cmd:{ul:bal}ance(}{it:balance_options}{cmd:)}  allows to manipulate the data as follows:

{p 8 11 2}
{cmd:none} should be specified, if you wish to use the unbalanced full sample

{p 8 11 2}
{cmd:weak} drops all observations of those countries which exhibit no entries for {cmd:trade} in one period of {cmd:time} 

{p 8 11 2}
{cmd:strong} drops for each country those {cmd:product} observations which are not reported over all periods of {cmd:time} 

{p 8 8 2}
If your data is not balanced this option is required. 

{p 4 7 2}
{cmd:sample(}{it:sample_file}{cmd:)} saves the sample used in the calculation. The identifying variables of the sample_file are {cmd:id}, {cmd:product}, and {cmd:time} (in case of panel data).


{title:Examples}

{col 3}{inp:{stata "use http://www.uni-regensburg.de/wirtschaftswissenschaften/vwl-moeller/medien/prody/data_prody.dta, clear"}}
*Please note: this are no real data
{col 3}{inp:{stata "prody using output_prody, trade(value) gdp(gdppc) time(year) id(country_desc) prod(indicator_desc) bal(none)"}}
{col 3}{inp:{stata "use output_prody, clear"}}

{title:References}

{p 5 8 2} 
Stephan Huber (2016): "Factor intensities and product sophistication: measurement matters". Downloadable under:
http://www.uni-regensburg.de/wirtschaftswissenschaften/vwl-moeller/forschung/index.html

{p 5 8 2} 
Ricardo Hausmann, Jason Hwang and Rodrik Dani (2007). "What you export matters". Journal of Economic Growth 12(1), 1-25

{title:Author}

{col 5} Stephan Huber
{col 5} Email: {browse "mailto:stephan.huber@wiwi.uni-regensburg.de":stephan.huber@wiwi.uni-regensburg.de}
