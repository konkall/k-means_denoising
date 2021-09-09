% X: 		Hyperspectral Image n x p that needs denoising
% 
% clusters: The number of representatives 'theta' that we will use
% 			to reconstruct the denoised hyperspectral image
function [Xnew]=denoising_kmeans(X, clusters)

    % n: The number of 'pixels' of the Hyperspectral image
    % p: The number of features/bands
    [n, p]=size(X);

    theta = zeros(clusters, p);
    theta_old = zeros(clusters, p);

    % Initializing 'theta' representatives by choosing random vectors from X
    % and adding some random noise.
    for i=1:1:clusters
        
        theta(i,:) = X(randi([1 n]),:) + 0.01*randn(1,p);
        
    end
    
    Xsq = sum(X.*X,2)';
    while any(sqrt(sum((theta-theta_old).*(theta-theta_old),2))> (1/2)*10^-5)
        
        % Calculating the nearest representative 'theta' to each 
		% pixel of the Hyperspectral image
        D = sqrt(bsxfun(@plus,Xsq ,sum(theta.*theta,2))-2*(theta*X'));
        [~,I] = min(D);
        
        theta_old = theta;
        
		% For every theta: Recalculate it as the mean of all the vectors/pixels 
		% that have this 'theta' as a representative.
		%
		% Note: It's true that the line below is unreadable BUT the 
		%		calculations were vectorized, and not done in a loop, to
		%		make them run much faster. Trust me, it's correct!
        theta = ((ones(clusters,1)*I == (1:clusters)' * ones(1,n))*X)./(sum(ones(clusters,1)*I == (1:clusters)' * ones(1,n),2) * ones(1,p));
        
        
    end

	% Reconstructing the denoised hyperspectral image based on
	% the 'theta' representatives we calculated above.
    Xnew = zeros(n,p);
    for i=1:1:n
        
        Xnew(i,:) = theta(I(1,i),:);
        
    end
    
end
