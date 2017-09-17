% REBUILD Concolution Backprojection (CEP).
%    REBUILD(OriginData, Angles) returns the matrix of absorptance.

function ret = rebuild(OriData, Theta)

% calculate fundamental image data
Num_Cam = size(OriData, 1);
Num_Ang = length(Theta);
MidIdx = (Num_Cam + 1) / 2;
Rad = (pi / 180) * Theta;
ret = zeros(Num_Cam, Num_Cam);

% coordinate settings
[X, Y] = meshgrid(1 : Num_Cam, 1 : Num_Cam);
X = X - MidIdx;
Y = Y - MidIdx;

% 1-D filter
FiltData = myfilter(OriData);

% backprojection
for i = 1 : Num_Ang
    % calculate spots address to be added filtered data
    Idx = round(MidIdx + X * sin(Rad(i)) - Y * cos(Rad(i)));

    % accumulate
    tmp = zeros(Num_Cam);
    tmpIdx = find((Idx > 0) & (Idx <= Num_Cam));
    tmp(tmpIdx) = FiltData(Idx(tmpIdx), i);
    ret = ret + tmp;
end
ret = ret / Num_Ang;
end