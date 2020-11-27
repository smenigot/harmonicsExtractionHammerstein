% function H = calculH(x,ordre,memoire)
% Build the input matrix
% Input
%	x the input signal
% 	order of the decomposition
% 	memory of the decomposition
% Output
% 	H input matrix

function H = calculH(x,ordre,memoire)

%% Build the matrix
T = toeplitz(x');
H = repmat(T(:,1:memoire),1,ordre)';

%% Modification for harmonic components

for kO = 2:ordre
    H((kO-1)*memoire+1:kO*memoire,:) = H((kO-1)*memoire+1:kO*memoire,:).^kO;
end
