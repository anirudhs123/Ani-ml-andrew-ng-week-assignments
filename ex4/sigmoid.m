function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.
[m2,n]=size(z);
for i=1:m2
  for j=1:n
    g(i,j)=1/(1+exp(-z(i,j)));
  endfor
endfor

end
