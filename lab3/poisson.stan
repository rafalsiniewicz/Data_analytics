/*
poisson distribution
*/

data {
    real mean_p;
}

generated quantities {
    real y = poisson_rng (mean_p);
}