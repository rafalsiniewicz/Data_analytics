data {
  int M;//number of years analyzed
  int y[M];//number of passengers deaths
}
parameters {
  real<lower=0>lambda;
}
model {
  lambda ~ normal(0,1348);
  for (k in 1:M) {
    y[k] ~ poisson(lambda);
  }
}
generated quantities {
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = poisson_rng(lambda);
  }
}