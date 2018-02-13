% This file provides an example of code commenting for solutions to assignments
% A1 and A2. Comments should be added which explain the functionality of each
% line of your code. Comments must be provided either immediately before, or at
% the end of, the line of code they explain, and the comments may be longer than
% one line in length. You need not add explanatory comments for end statements.

% Create a function accepting one input n, and returning the output is_prime.
% is_prime will equal 1 if n is found to be prime, and 0 otherwise. It is
% assumed here that n is a positive integer.
function [is_prime] = is_prime_commented(n)  
  is_prime = 1;           % Initialise the return variable is_prime to 1. This
                          % will be set to 0 later if n is found to be not
                          % prime.

  if n == 1               % Treat n = 1 as a special case
    % If n = 1 then it is not prime ...
    is_prime = 0;         
  else
    % ... otherwise perform further testing
    for i = 2:sqrt(n)     % Loop over all possible factors of n (excluding 1 and
                          % n). A complete test is achieved if we test only
                          % integers <= sqrt(n) here.
      if mod(n, i) == 0   % If n is divisible by the test integer i then ...
        is_prime = 0;     % ... it is not prime ...
        break;            % ... and we need perform no further testing, and can
                          % exit the loop
      end
    end
  end
end
