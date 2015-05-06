% Initialize the workspace
clear all
close all

% Constants
G = 6.67E-11;
M_sun = 1.99E30;
AU = 149597870700;
dt = 1; % day
N = 1E3;

% Initial Astronomical Data
m_mercury = 3.302E23;                                   % kg
x0_mercury = (-3.589070923093208E-01)*AU;               % m
y0_mercury = (8.140221586479408E-02)*AU;                % m
r0_mercury = sqrt((x0_mercury^2)+(y0_mercury^2));       % m
vx0_mercury = ((-1.205489207680449E-02)*AU)/86400;              % m/day
vy0_mercury = ((-2.623106213623277E-02)*AU)/86400;              % m/day

% Initialize
x_mercury = [];
x_mercury(1) = x0_mercury;
y_mercury = [];
y_mercury(1) = y0_mercury;
vx_mercury = [];
vx_mercury(1) = vx0_mercury;
vy_mercury = [];
vy_mercury(1) = vy0_mercury;

for t = 1:N
  vx_mercury(t+dt) = vx_mercury(t) + dt*((-G*M_sun)/(((x_mercury(t))^2)+((y_mercury(t))^2))^(3/2))*x_mercury(t);
  x_mercury(t+dt) = x_mercury(t) + dt*vx_mercury(t+dt);
  vy_mercury(t+dt) = vy_mercury(t) + dt*((-G*M_sun)/(((x_mercury(t))^2)+((y_mercury(t))^2))^(3/2))*y_mercury(t);
  y_mercury(t+dt) = y_mercury(t) + dt*vy_mercury(t+dt);
end

plot(x_mercury,y_mercury)

