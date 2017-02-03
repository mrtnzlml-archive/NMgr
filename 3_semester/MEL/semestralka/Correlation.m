classdef Correlation
    %CORRELATION Correlation and dependence
    %    Implementation of Pearson, Spearman and correlation algorithms.
    %    Tests are located in CorrelationTest file.

    properties (SetAccess = private)
        withGraphics;
    end

    methods
        function obj = Correlation(withGraphics) % constructor
            if nargin == 0
                withGraphics = false;
            end
            obj.withGraphics = withGraphics;
        end

        function rho = pearson(obj, X, Y)
            [X, Y] = obj.vectorize(X, Y);
            rho = obj.pearsonWithoutVectorize(X, Y);
        end

        function rho = spearman(obj, X, Y)
            [X, Y] = obj.vectorize(X, Y);
            [~, rankX] = sort(X); % calulate Spearman ranking
            [~, rankY] = sort(Y);
            rho = obj.pearsonWithoutVectorize(rankX, rankY);
        end
    end

    methods (Access = private)
        function [X, Y] = vectorize(obj, X, Y)
            X = X(:); Y = Y(:);
        end

        function rho = pearsonWithoutVectorize(obj, X, Y)
            covariance = cov(X, Y);
            rho = covariance(1, 2) / (std(X) * std(Y));
            if isnan(rho)
                error('pearson:undefined', 'Correlation coefficient is undefined because the variance of Y is zero.')
            end
            if obj.withGraphics
                plotmatrix(X, Y)
            end
        end
    end

end
