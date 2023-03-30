# Exact binomial 95% confidence intervals were calculated around the *in silico* positivity rates and *in vitro* sensitivity and specificity

# Load R library

library(binom)

# *In silico* results
binom.test(7518, 7547, conf.level = 0.95)
binom.test(1, 1825, conf.level = 0.95)

# *In vitro* results

#Sensitivity
binom.test(246,246, conf.level = 0.95)

#Specificity
binom.test(277,277, conf.level = 0.95)
