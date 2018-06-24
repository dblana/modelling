% Example of how to run muscle_model.m

% Define parameters
Fmax = 100;                 % maximum isometric force (N)
opt_flen = 0.1;             % optimal fibre length (m)
opt_penn_angle = 0*pi/180;  % pennation angle at optimal fibre length (radians)

% Define variables
act = 1;                % activation
flen = 0.01:0.01:0.18;  % fibre length (m)
fvel = 0;               % fibre velocity (m/s)

% Initialize outputs
Fact  = zeros(size(flen));
Fpass = zeros(size(flen));

for i=1:length(flen)
    [Fact(i), Fpass(i)] = muscle_model(act, flen(i), fvel, Fmax, opt_flen, opt_penn_angle);
end

plot(flen/opt_flen,Fact,flen/opt_flen,Fpass); hold on;
legend('Active force', 'Passive force');
xlabel('Normalised fibre length');
ylabel('Force (N)');
title('Muscle force based on contractile and passive elastic elements');