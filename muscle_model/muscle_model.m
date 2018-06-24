function [Fact, Fpass] = muscle_model(act, flen, fvel, Fmax, opt_flen, opt_penn_angle)
% muscle_model: Matlab version of the Hill-type muscle contraction model
% 
% For simplicity, this does not include the series elastic element
% The force at the series elastic element equals Fact + Fpass, so if we
% include it we end up with an implicit first order differential equation 
% (with fibre length as the variable)
% So this function does not show the effect of the tendon slack length
%
% inputs:   variables and parameters
%
% variables:    act: the activation
%               flen: fibre length
%               fvel: fibre velocity
%
% parameters:   Fmax: maximum isometric force the muscle can produce, which
%               is estimated as the physiological cross-sectional area
%               multiplied by the specific tension (100N/cm^2)
%               opt_flen: optimal fibre length
%               opt_penn_angle: pennation angle at optimal fibre length
% 
% Dimitra Blana, November 2016

% Compute pennation angle from constant volume constraint:
% flen*sin(penn_angle) = opt_flen*sin(opt_penn_angle)
if flen==0, flen = 0.0001; end  % make sure flen is never exactly zero
sin_penn_angle = opt_flen*sin(opt_penn_angle) / flen;
if sin_penn_angle>1, sin_penn_angle = 1; end
penn_angle = asin(sin_penn_angle);

% F_fl is the normalised isometric force-length relationship at max activation
% width is a parameter describing the Gaussian curve, and is set to 0.56:
width = 0.56;
F_fl = exp(-((flen - opt_flen)/(width*opt_flen))^2);
		
% F_fv is the normalised force-velocity relationship
% Vmax is the max shortening velocity at full activation, and it is assumed
% to have a value of 10 time the optimal fibre length per second.
% HillA is the Hill curve parameter, and it is set to 0.25.
% gmax is the max normalised eccentric muscle force, and it is set to 1.5.
Vmax = 10*opt_flen;
HillA = 0.25;
gmax = 1.5;

if (fvel < 0) 
    % concentric contraction
    F_fv = (Vmax + fvel)/(Vmax - fvel/HillA);
else 
    % eccentric contraction
    c = Vmax * HillA * (gmax - 1.0) / (HillA + 1.0);
    F_fv = (gmax*fvel + c) / (fvel + c);
end
	
% F_pee is the parallel passive elastic element force-length relationship
k1 = 10.0;                              % stiffness of the linear term is 10 N/m
                                        % (used to ensure stiffness is never zero)
x = flen - opt_flen;                    % elongation of PEE, relative to optimal fibre length
F_pee = k1*x;                           % low stiffness linear term

% The stiffness parameter k_pee is chosen such that when the contractile element is stretched 
% to its maximal length for active force production (=width*opt_flen), 
% the PEE force equals the maximum isometric force
k_pee = Fmax / (width*opt_flen)^2;
if x>0, F_pee = F_pee + k_pee*x^2; end	% add quadratic term for positive elongation								
	
Fact = act*F_fl*F_fv*cos(penn_angle)*Fmax;
Fpass = F_pee*cos(penn_angle);

end

