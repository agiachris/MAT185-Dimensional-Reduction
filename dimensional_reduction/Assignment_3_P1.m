% Christopher Agia
% Student #: 100 324 3509
% 1.7

clear all;
format long;

% a) done in make_A function
disp('a)');
disp('part a) is completed in the make_A funcion');
% b) computing the eigenvalues using the eig function, and formula (5).
%    the norms of each array of eigenvalues will be calculated and
%    compared. 
disp('b)');

N = 10;

h = 1/(N + 1);
x_j = [h: h: 1-h];

lambda_1 = sort(eig(make_A(N)));
lambda_2 = zeros(1, N);

disp('The eigenvalues using formula(5) are:');
for n = 1: N
	lambda_2(n) = 2*(1 - cos(pi * x_j(n)));
    disp(lambda_2(n));
end

if norm(lambda_1) == norm(lambda_2)
    disp(sprintf('The norms are: %d, %d', norm(lambda_1), norm(lambda_2)));
	disp('Therefore, the eigenvalues are the same');
else
	disp('The eigenvalues are different');
end

% c) Will compute the eigenvalues of A at N = 10, 100, 500, 1000 to show
% that the max/min eigenvalues exist (0,4)
disp('c)');

N = 0;
N_vals = [10 100 500 1000];
for i = 1: 4
    
    N = N_vals(i);
    lambda_1 = sort(eig(make_A(N)));
    
    maxL1 = lambda_1(N);
    minL1 = lambda_1(1);
    
    disp(sprintf('At N = %d', N));
    disp(sprintf('The min eigenvalue is: %d', minL1));
    disp(sprintf('The max eigenvalue is: %d', maxL1)); 
end

disp('As you can see, the max/min eigenvalues exist (0,4)');
disp('Observations as N increases:');
disp('The min eigenvalues get closer to 0');
disp('The max eigenvalues get closer to 4'); 

% d) Solving formula 1 at N = 100
disp('d)');

N = 100;
h = 1/(N + 1);
x = [h: h: 1 - h].';
cube_x = (x).^3;
f_x = 1 - cube_x;
A = make_A(N);
A = 1/((h)^2)*A;

U = A\f_x;
disp(sprintf('The Euclidian Norm is: %d', norm(f_x - A*U)));

% e) Plotting the approximate solution and the exact solution, as well as
% computing the descritized error.
disp('e)');
disp('A figure containing U_exact vs U_approx will be plotted');
disp('The descretized error will be computed');

N = 100;
x = [h: h: 1-h].';

cube_x = (x).^3;
f_x = 1 - cube_x;
A = make_A(N);
A = 1/((h)^2)*A; 

u_approx = A\f_x;
u_exact = (-0.5*(x.^2) + 0.05*(x.^5) + 0.45*x);

u_app = [N + 2; 1];
u_app(1) = 0;
u_app(N + 2) = 0;
u_ex = [N + 2; 1];
u_ex(1) = 0;
u_ex(N + 2) = 0;

new_x_vals = [0: h: 1];

for i = 1: N
    u_app(i + 1) = u_approx(i);
    u_ex(i + 1) = u_exact(i);
end

figure;
plot(new_x_vals, u_app, 'r');
hold on;
plot(new_x_vals, u_ex, 'k--');
legend('u_a_p_p_r_o_x', 'u_e_x_a_c_t');
xlabel('x');
ylabel('u');
title(sprintf('u_e_x_a_c_t vs u_a_p_p_r_o_x at N = %d', N));

error = zeros(4, 1);
k = 1;
for i = 2: N + 1
    error(k) = error(k) + h*((u_app(i) - u_ex(i))^2);
end
error(k) = (error(k))^0.5; 


% f) finding the descritized error at N = 10, 100, 500, 1000
disp('f)');
disp('A Log(Error) vs Log(h) figure will be displayed'); 

k = 1;
N_vals = [10 100 500 1000];
error = zeros(4, 1);

figure;
for j = 1: 4
    N = N_vals(j);
   
    h = 1/(N + 1);
    x = [h: h: 1 - h].';
    cube_x = (x).^3;
    f_x = 1 - cube_x;
    A = make_A(N);
    A = 1/((h)^2)*A;

    U = A\f_x;
    
    u_approx = A\f_x;
    u_exact = (-0.5*(x.^2) + 0.05*(x.^5) + 0.45*x);

    u_app = [N + 2; 1];
    u_app(1) = 0;
    u_app(N + 2) = 0;
    u_ex = [N + 2; 1];
    u_ex(1) = 0;
    u_ex(N + 2) = 0;

    new_x_vals = [0: h: 1];
    
    for i = 1: N
        u_app(i + 1) = u_approx(i);
        u_ex(i + 1) = u_exact(i);
    end

    subplot(2, 2, j);
    plot(new_x_vals, u_app, 'r');
    hold on;
    plot(new_x_vals, u_ex, 'k--');
    legend('u_a_p_p_r_o_x', 'u_e_x_a_c_t');
    xlabel('x');
    ylabel('u');
    title(sprintf('u_e_x_a_c_t vs u_a_p_p_r_o_x at N = %d', N));
    
    for i = 2: N + 1
        error(k) = error(k) + h*((u_app(i) - u_ex(i))^2);
    end
    error(k) = (error(k))^0.5;
    
    k = k + 1;
end

figure;
h_axis = [1/11 1/101 1/501 1/1001];
loglog(h_axis, error);
title('Log-Log Error vs h');
xlabel('Log h');
ylabel('Log Error');


		
