classdef GenerateDemoData
    %GENERATEDEMODATA Class for generation demo data
    %   This class is quite pointless with stupid API, but it generates
    %   random data with value deviation around math curve and that's
    %   pretty useful for correlation testing.

    properties (SetAccess = private)
        length;
        deviationScale;
    end

    methods
        function obj = GenerateDemoData(length, deviationScale)
            if nargin == 0
                length = 1000;
                deviationScale = 1;
            end
            obj.length = length;
            obj.deviationScale = deviationScale;
        end

        function [X, Y] = exponential(obj)
            [X, Y] = obj.generateTable(@(x) x^3-0.5e9, obj.length * 3e5 * obj.deviationScale);
        end

        function [X, Y] = quadratic(obj)
            [X, Y] = obj.generateTable(@(x) -x^3+0.5e9, obj.length * 1e5 * obj.deviationScale);
        end
    end

    methods (Access = private)
        function value = randn(obj, mu, sigma)
            value = (randn * sigma) + mu;
        end

        function [X, Y] = generateTable(obj, func, deviation)
            for index = 1:obj.length
                X(index) = index;
                Y(index) = obj.randn(func(index), deviation);
            end
        end
    end

end
