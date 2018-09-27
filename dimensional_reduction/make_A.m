function [A] = make_A(N)
% Make a tridiagonal matrix of size (N,N)
A = 2*eye(N) + (-1)*triu(ones(N,N), 1) + triu(ones(N,N), 2) + (-1)*tril(ones(N,N), -1) + tril(ones(N,N), -2);
end
