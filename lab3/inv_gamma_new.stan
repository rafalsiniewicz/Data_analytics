functions {
  vector inv_gamma_fun(vector y, vector theta, real[] x_r, int[] x_i) {
    vector[3] deltas;
    
    deltas[1] = inv_gamma_cdf(theta[1], y[1], y[2]) - y[3];
    deltas[2] = inv_gamma_cdf(theta[2], y[1], y[2]) - (y[3] + 0.98);
    deltas[3] = y[2]/(y[1]-1) - 10;  
    
    return deltas;
  }
}

data {
  vector[2] theta;     
  vector[3] y_guess;
}

transformed data {
  vector[3] y;
  real x_r[0];
  int x_i[0];
  
  y = algebra_solver(inv_gamma_fun, y_guess, theta, x_r, x_i);
  
}

generated quantities {
    real gamma = gamma_rng(y[1],y[2]);
    real inv_gamma = inv_gamma_rng(y[1],y[2]);
}