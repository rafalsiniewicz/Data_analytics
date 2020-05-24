/*
negative binomial distribution concentration
*/

data {
    real alpha;
    real mu;
}

generated quantities {
    real nbin_con = neg_binomial_rng (alpha, alpha/mu);
    real poisson_con = poisson_rng(nbin_con);
}