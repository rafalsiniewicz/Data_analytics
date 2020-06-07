/*
negative binomial distribution concentration
*/

data {
    real alpha;
    real beta;
}

generated quantities {
    real nbin_con = neg_binomial_rng (alpha, beta);
    real poisson_con = poisson_rng(alpha/beta);
}