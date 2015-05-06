% Initialize the workspace
clear all
close all

% Constants
G = 6.67E-11;
M_sun = 1.99E30;
AU = 149597870700;
dt = 1; % day
N= 10E3;

% Initial Astronomical Data

m_mer = 3.302E23;                                   % kg
x0_mer = (-3.589070923093208E-01)*AU;               % m
y0_mer = (8.140221586479408E-02)*AU;                % m
r0_mer = sqrt((x0_mercury^2)+(y0_mercury^2));       % m
vx0_mer = (-1.205489207680449E-02)*AU;              % m/day
vy0_mer = (-2.623106213623277E-02)*AU;              % m/day

m_ven=48.685E23;
x0_ven=(-6.739657410751212E-01)*AU;
y0_ven=(2.469487903053326E-01)*AU;
vx0_ven=(-7.053527055179429E-03)*AU;
vy0_ven=(-1.908454452556405E-02)*AU;

m_ear=5.97219E24;
x0_ear=(-7.137340399456858E-01)*AU;
y0_ear=(-7.126542190864458E-01)*AU;
vx0_ear=(1.186969339041327E-02)*AU;
vy0_ear=(-1.223660498309249E-02)*AU;

m_mar= 6.4185E23;
x0_mar=(6.935475445945375E-01)*AU;
y0_mar=(1.331794955323579)*AU;
vx0_mar=(-1.187905173139429E-02)*AU;
vy0_mar=(7.654591656039177E-03)*AU;

m_jup=1898.13E24;
x0_jup=(-4.353961300582235)*AU;
y0_jup=(3.122229226450782)*AU;
vx0_jup=(-4.491875201115330E-03)*AU;
vy0-jup=(-5.781575400472276E-03)*AU;

m_sat=5.68319E26;
x0_sat=(-4.849070601304748)*AU;
y0_sat=(-8.711020447184474)*AU;
vx0_sat=(4.566550939047917E-03)*AU;
vy0_sat=(-2.734300088507687E-03)*AU;

m_ura=86.8103E24;
x0_ura=(1.916511428059886E+01)*AU;
y0_ura=(5.700584912014886)*AU;
vx0_ura=(-1.152842033048181E-03)*AU;
vy0_ura=(3.580531436715544E-03)*AU;

m_nep=102.41E24;
x0_ura=(2.767649837099084E+01)*AU;
y0_ura=(-1.147982710403863E+01)*AU;
vx0_ura=(1.179094127802528E-03)*AU;
vy0_ura=(2.912599569431942E-03)*AU;

% Initialize

x_mer = [];
x_mer(1) = x0_mer;
y_mer = [];
y_mer(1) = y0_mer;
vx_mer = [];
vx_mer(1) = vx0_mer;
vy_mer = [];
vy_mer(1) = vy0_mer;

x_ven = [];
x_ven(1) = x0_ven;
y_ven = [];
y_ven(1) = y0_ven;
vx_ven = [];
vx_ven(1) = vx0_ven;
vy_ven = [];
vy_ven(1) = vy0_ven;

x_ear = [];
x_ear(1) = x0_ear;
y_ear = [];
y_ear(1) = y0_ear;
vx_ear = [];
vx_ear(1) = vx0_ear;
vy_ear = [];
vy_ear(1) = vy0_ear;

x_mar = [];
x_mar(1) = x0_mar;
y_mar = [];
y_mar(1) = y0_mar;
vx_mar = [];
vx_mar(1) = vx0_mar;
vy_mar = [];
vy_mar(1) = vy0_mar;

x_jup = [];
x_jup(1) = x0_jup;
y_jup = [];
y_jup(1) = y0_jup;
vx_jup = [];
vx_jup(1) = vx0_jup;
vy_jup = [];
vy_jup(1) = vy0_jup;

x_sat = [];
x_sat(1) = x0_sat;
y_sat = [];
y_sat(1) = y0_sat;
vx_sat = [];
vx_sat(1) = vx0_sat;
vy_sat = [];
vy_sat(1) = vy0_sat;

x_ura = [];
x_ura(1) = x0_ura;
y_ura = [];
y_ura(1) = y0_ura;
vx_ura = [];
vx_ura(1) = vx0_ura;
vy_ura = [];
vy_ura(1) = vy0_ura;

x_nep = [];
x_nep(1) = x0_nep;
y_nep = [];
y_nep(1) = y0_nep;
vx_nep = [];
vx_nep(1) = vx0_nep;
vy_nep = [];
vy_nep(1) = vy0_nep;



for t = 1:N
  vx_mer(t+1) = vx_mer(t) + dt*(((-G*M_sun)/(((x_mer(t))^2)...
      +((y_mer(t))^2))^(3/2))*x_mer(t)+(G*M_sun)/((((x_mer(t)-x_ven(t)))^2+...
      (y_mer(t)-y_ven(t))^2)^(3/2))*(x_mer(t)-x_ven(t))+(G*M_sun)/...
      (((x_mer(t)-x_ear(t))^2+(y_mer(t)-y_ear(t))^2)^(3/2))*(x_mer(t)...
      -x_ear(t))+(G*M_sun)/(((x_mer(t)-x_mar(t))^2+(y_mer(t)-y_mar(t))^2)...
      ^(3/2))*(x_mer(t)-x_mar(t))+(G*M_sun)/(((x_mer(t)-x_jup(t))^2+(y_mer(t)...
      -y_jup(t))^2)^(3/2))*(x_mer(t)-x_jup(t))+(G*M_sun)/(((x_mer(t)-x_sat(t))...
      ^2+(y_mer(t)-y_sat(t))^2)^(3/2))*(x_mer(t)-x_sat(t))+(G*M_sun)/...
      (((x_mer(t)-x_ura(t))^2+(y_mer(t)-y_ura(t))^2)^(3/2))*...
      (x_mer(t)-x_ura(t))+(G*M_sun)/(((x_mer(t)-x_nep(t))^2+(y_mer(t)-...
      y_nep(t))^2)^(3/2))*(x_mer(t)-x_nep(t)))
  x_mer(t+1) = x_mer(t) + dt*vx_mer(t);
  vy_mer(t+1) = vy_mer(t) + dt*(((-G*M_sun)/(((x_mer(t))^2)+...
      ((y_mer(t))^2))^(3/2))*y_mer(t)+(G*M_sun)/((((x_mer(t)-x_ven(t)))^2+...
      (y_mer(t)-y_ven(t))^2)^(3/2))*(y_mer(t)-y_ven(t))+(G*M_sun)/...
      (((x_mer(t)-x_ear(t))^2+(y_mer(t)-y_ear(t))^2)^(3/2))*(y_mer(t)...
      -y_ear(t))+(G*M_sun)/(((x_mer(t)-x_mar(t))^2+(y_mer(t)-y_mar(t))^2)...
      ^(3/2))*(y_mer(t)-y_mar(t))+(G*M_sun)/(((x_mer(t)-x_jup(t))^2+(y_mer(t)...
      -y_jup(t))^2)^(3/2))*(y_mer(t)-y_jup(t))+(G*M_sun)/(((x_mer(t)-x_sat(t))...
      ^2+(y_mer(t)-y_sat(t))^2)^(3/2))*(y_mer(t)-y_sat(t))+(G*M_sun)/...
      (((x_mer(t)-x_ura(t))^2+(y_mer(t)-y_ura(t))^2)^(3/2))*...
      (y_mer(t)-y_ura(t))+(G*M_sun)/(((x_mer(t)-x_nep(t))^2+(y_mer(t)-...
      y_nep(t))^2)^(3/2))*(y_mer(t)-y_nep(t)));
  y_mer(t+1) = y_mer(t) + dt*vy_mer(t);
end

% This for loop woud=ld be mimiced for each of the seven other planets

plot(x_mer,y_mercury)
hold on
plot(x_ven,y_venus)
hold on
plot(x_ear,y_earth)
hold on
plot(x_mar,y_mars)
hold on
plot(x_jup,y_jup)
hold on
plot(x_sat,y_sat)
hold on
plot(x_ura,y_ura)
hold on
plot(x_nep,y_nep)
