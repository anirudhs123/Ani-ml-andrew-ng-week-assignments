#adding the procured data
hold off;
conc=load('conc.txt');
time=load('time.txt');
#finding out the size of the data
m=size(conc,1);

#adding the concentartions of each gas
co=conc(1:(m/2));
co2=conc((m/2)+1:m);

#obtaining the time at which the data is collected
hours=zeros(size(time,1),1);
hours=time(:,1);

mins=zeros(size(time,1),1);
mins=time(:,2);

secs=zeros(size(time,1),1);
secs=time(:,3);
#repesenting the time as a function of number of seconds
#elapsed in the day till then


timeofday=zeros(size(hours));
timeofday=zeros(size(hours));
timeofday=hours.*3600+mins.*60+secs;
#plotting the obtained data from the cloud
fprintf('Plotting Data ...\n');
datadisplay();

#removing the outliers from the graphs

[co,co2,timeofdayx,timeofdayy]=outliers(co,co2,timeofday);

#running cost functions in the new obatined data values
m=size(co,1);
n=size(co2,1);
X = [ones(m, 1), timeofdayx(:,1)];
Y = [ones(n, 1), timeofdayy(:,1)];
theta1 = zeros(2, 1); #intial value for theta
theta2 = zeros(2, 1);
#we can also try gradient decent
#iterations = 1500;
#alpha = 0.01;


#using normal equations

theta1=normalEqn(X,co);
theta2=normalEqn(Y,co2);

#plotting te linear fit to the graph

hold on; % keep previous plot visible
plot(X(:,2), X*theta1, '-');
legend('co concentartions', 'time');


plot(Y(:,2), Y*theta2, '-')
legend('co2 concentarations', 'time');