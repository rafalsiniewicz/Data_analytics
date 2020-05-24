/*
negative binomial distribution dispersion
*/

data {
    real mu;
    real phi;
}

generated quantities {
    real nbin_disp = neg_binomial_2_rng (mu, phi);
    real poisson_disp = poisson_rng(nbin_disp);
}