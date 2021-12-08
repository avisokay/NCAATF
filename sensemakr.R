# implementing sensitivity analysis with sensemakr for the super shoes DiD project

library(sensemakr)

# load tfrrs cleaned and prepped dataset
tfrrs <- read.csv("C:\\Users\\Adam\\Desktop\\code_projects\\GitHub\\NCAATF\\final_data.csv")

# fit 2x2 DiD model
model <- lm(TIME_SECS_SCALED ~ TREAT + AFTER + TREAT*AFTER, data = tfrrs)

sensitivity <- sensemakr(model = model, 
                         treatment = "TREAT:AFTERTrue",
                         benchmark_covariates = "TREAT",
                         kd = 1:3)

# check results for both specifications
summary(sensitivity)

# latex output code
ovb_minimal_reporting(sensitivity, format = "latex")

plot(sensitivity)

