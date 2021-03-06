
context("Data structure check")

data("birds")

mult_col <- birds

mis_col <- birds

colnames(mult_col) <- c("Scientific.name", "Empty.mass", "Wing.span",
                        "Fat.mass", "name", "Order" )

colnames(mis_col) <- c("Scientific.name", "Empty.mass", "Wing.span",
                        "Fat.mass", "X1", "Wing.area")

test_that("Multiple column match throw error", {
  expect_error(.colnames.match(data = mult_col))
})

vect <- c(4,5,6,7,9)

test_that("Not dataframe throws error", {
  expect_error(.colnames.match(data = vect))
})

test_that("Missing column match throws error", {
  expect_error(.colnames.match(data = mis_col))
})

# check on factor maybe shouldnt be here
bad_factor <- birds[, -5]

bad_factor$ordo <-  as.factor(rep(c(3,2), 14))
bad_factor$muscleMass <- runif(nrow(bad_factor), min = 0.001, max = 0.007)

test_that("Factor in ordo other 1 and 2 throws error", {
  expect_error(.colnames.match(data = bad_factor))
})

no_muscle_mass <- birds[1:6]

test_that("No muscle mass throws a warning", {
  expect_warning(.colnames.match(data = no_muscle_mass))
})
