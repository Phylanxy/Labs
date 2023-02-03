# Hypothesis Testing Summary
## Variables of the Problem
MU - mean of the *population*
\bar{x} - mean of the *sample*
\sigma - standard deviation of the *population*
s - standard deviation of the *sample*
n - size of the *sample*

## Parameters to set
ALPHA = level of significance (in most cases ALPHA = 0.05%), can also be described as the probability of exceeding the critical value.
The confidence interval is the inverse of ALPHA: 1 - ALPHA 

## Define the Problem
1. What am I looking at? 
2. What represents the population? 
3. What represents the sample?
4. What are the associated variables and their values?

## The Hypotheses
1. Set the null-Hypothesis (H0) as some variable equals zero. This means that whatever event you are observing, H0 describes the assumption that it is not statistically relevant and therefore your observations aren't in accordance with the data.
2. The alternative of the null-Hypothesis is the alternate Hypothesis (H_ALPHA) and it is per definition the opposite of H0. Therefore, if H0: MU = 0, then H_ALPHA: MU \neq 0. If H0: MU < 0, then H_ALPHA MU >= 0. And so on.

## Collect Sample Data
Collect data from a sample of the population and calculate the mean and standard deviation:
mean of the *sample* - \bar{x}, standard deviation of the *sample* - s

## Test the null-Hypothesis
### Calculate the t- or z-score
1. The t distribution has to be used in the following steps if:
- ... the sample size is below 30
- ... the mean of the population is unknown, then the mean of the sample is used instead.
2. Otherwise, the normal distribution is used, with the z-score instead of the t-score.
3. Use the following formula for the z-score: 
 t = \frac{MU - \bar{x}}{\frac{\sigma}{\sqrt{n}} 
3.1 Use the following formula for the t-score: 
 t = \frac{MU - \bar{x}}{\frac{s}{\sqrt{n}} 
4. Compare the result to the t- or z-score determined either through reading the corresponding value from a table or calculate it in Python. Make sure you know if you are using the standard normal distribution or t-student distribution (t-student distribution if n < 30 or you don't know the population mean).
4.1 In order to do this for a one-sided test with a level of significance of 5%, find the corresponding column (5%) and row (n - p, with p being the number of changeable variables you are observing) and read the value in the field. 
4.2 For a two-sided test, you need to divie the level of significance of 5% by 2, to account for the possibility of the value being higher *or* lower than given in the H0. Therefore, find the column with 2.5% and the correct row, read the value. 
4.3 One-sided: 
In Python, run the command scipy.stats.t.ppf(1-ALPHA, df=(n - p)) *or* scipy.stats.norm.ppf(1-ALPHA) to get the t- or z-value for the observed sample.
4.4 Two-sided: 
In Python, run the command scipy.stats.t.ppf(1-(ALPHA/2), df=(n - p)) *or* scipy.stats.norm.ppf(1-(ALPHA/2)) to get the t- or z-value for the observed sample.

 
## Tips & Tricks
The critical z-score value for one-sided test with a level of significance of ALPHA = 0.05%  is 1.64. This applies for all one-sided tests on *normal distribution*.

For two-sided tests the critical z-score for normal distribution is + or -1.96.
