%{####################################################################
1. Basic operatioins of octave
%}

% some special metrics
eye(3);     % identity matrix
flipud(eye(3)); % provides 1 to anti-diagnol line
ones(2,3);  % matrix with all ones
zeros(2,3); % matrix with all zeros
magic(3);   % rows, columns, diagonals with the same sum value

% get A size
A = [1 2;3 4;5 6];
sz = size(A);   % get the size of the matrix
size(A,1);      % get the matrix column num
size(A,2);      % get the matrix row num
A(3,2);         % access column 3 and row 2, which is 6
A(2, :);        % ":" means every element along row/column
A(:,2):         % get column 2 elements
A([1 3], :);    % get row 1 and 3 elements 
A(:,2) = [10;11;12];    % overwrite all elements at column 2 with new values
A = [A [100;101;102]];  % append the third column to A
A(:)            % put all elements A into a single vector
B = [11 12; 13 15; 16 17];
C = [A B];      % append B to A horizontally
C = [A;B];      % append B to A vertically

%get vector size
v = [1;2;3;4;5;6];
length(v);

% folder and file ops
pwd                     % print current directory
cd 'directory'          % change the current directory
load "filename"         % load dataset
save "filename" item    % item is a variable, we save item to the filenae
clear                   % delete all variables in workspace
who                     % to find the variables under the curerent scope/workspace
whos                    % extension of who, provides more details like size, and class
addpath("file to search by octave") % add search path
%{####################################################################
2. vector and matrix operations
%}
A = [1 2; 3 4; 5 6];
B = [11 12; 13 14; 15 16];
C = [1 1; 2 2];

% matrix operations
A*C;        % matrix multiplication
A.*B;       % element wise multiplication
A.^2;       % element wise power of two
A';         % transpose A
max(A, [], 1); % return max value row wise
max(A, [], 2); % return max value column wise

# vector operations
v = [1;2;3];
1./v;       % element wise inverse of v
log(v);     % log of v
exp(v);     % exp of v
abs(v);     % absolute number of v
-v;         % equivalent to (-1) .* v
v + ones(length(v),1); % which is equivalent to v + 1
max(v);     % find max value of v, which is 3
v <= 2;     % return back a vector with true or false, which element wise compare with 2
find(v<=2); % returns the index of v where v <= 2
sum(v);     % summation of v
prod(v);    % mulitplication of v
floor(v);   % round down
ceil(v);    % round up

%{####################################################################
3. plotting
%}

% basic plotting
t = [0:0.01:0.98];  % set the time
y1 = sin(2*pi*4*t); % get sin 
plot(t, y1);        % generate the plot of t and y1
y2 = cos(2*pi*4*t);
plot(t,y2);

% generate an image with two plots
plot(t,y1);
hold on;
plot(t,y2);
xlabel('time');             % write the x label
ylabel('value');            % write the y label
legend('sin','cos')         % write the legend
title('my plot')            % set the title of the image
print -dpng 'filename.png'  % save the image as a png
close;                      % close image window

% create image one plot each time
figure(1); plot(t,y1);  % plot image as figure 1
figure(2); plot(t,y2);

% create one image with two plots
subplot(1,2,1); plot(t,y1); % subdivie the plot into 1x2 grid
subplot(1,2,2); plot(t,y2);
axis[0.5 1 -1 1];           % set the axis of the subplot
clf;                        % clear image

# 
imagesc(magic(6));
imagesc(magic(15)), colorbar, colormap gray;

%{####################################################################
4. controls
%}

v = ones(20,1);

% for loop
for i = 1:10,
    v(i) = 2^i;
end;

% while loop
i = 1;
while i<=5,
    v(i) = 100;
    i = i + 1;
end;

% while loop with break
i=1;
while true,
    v(i) = 999;
    i = i + 1;
    if i == 6,
        break;
    end;
end;

% if else..
v(1) = 2;
if v(1) == 1,
    disp('The value is one');
elseif v(1) == 2,
    disp('The value is two');
else
    disp('The value is not one or two');
end;

% functions
function y = squareThisNumber(x)
y = x^2;
a = squareThisNumber(2)

% function that returns 2 values, y1 and y2
function [y1,y2] = squareAndCubeThisNumber(x)
y1 = x^2;
y2 = x^3;
[a,b] = squareAndCubeThisNumber(3);
