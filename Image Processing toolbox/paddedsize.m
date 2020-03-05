
function PQ = paddedsize(AB, CD, PARAM)
if nargin == 1
PQ = 2*AB;
elseif nargin == 2 & ~ischar(CD)
PQ =AB + CD - 1;
PQ = 2 * ceil(PQ / 2);
elseif nargin == 2
m = max(AB);
p = 2^nextpow2(2*m);
PQ = [p, p];
elseif nargin == 3
m = max([AB CD]);
p = 2^nextpow2(2*m);
PQ = [p, p];
else
error('Wrong number of inputs.');
end