data {
  real df;
  real mu;
  real sigma;
}

generated quantities {
    real y = student_t_rng(df, mu,sigma);
}