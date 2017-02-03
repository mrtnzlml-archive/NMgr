classdef CorrelationTest < matlab.unittest.TestCase
    % run(CorrelationTest)

    methods (Test)
        function testPearsonCorrelated(testCase)
            % actual, expected, ...
            assert = @(x, y) testCase.verifyEqual(pearson(Correlation, x, y), 1.0, 'AbsTol', 1e-15);
            assert([1 2 3 4], [1 2 3 4]);
            assert([1 2 3 4], [1 3 5 7]);
            assert([1 3 5 7], [1 2 3 4]);
        end

        function testPearsonAnticorrelated(testCase)
            A = [1 2 3 4];
            B = [4 3 2 1];
            testCase.verifyEqual(pearson(Correlation, A, B), -1.0, 'AbsTol', 1e-15);
        end

        function testPearsonWithoutCorrelation(testCase)
            A = [3 4 5 6];
            B = [1 1 1 1];
            testCase.verifyError(@() pearson(Correlation, A, B), 'pearson:undefined', 'Correlation coefficient is undefined because the variance of Y is zero.');
        end

        function testPearsonZeroCorrelation(testCase)
            A = [1 2 1 2];
            B = [1 1 2 2];
            testCase.verifyEqual(pearson(Correlation, A, B), 0.0);
            testCase.verifyEqual(spearman(Correlation, A, B), 0.8);
        end

        function testSpearmanHalfCorrelation(testCase)
            % Spearman should be 0.5 but Kendall shoul be 1.0
            A = [1 2 3];
            B = [1 3 2];
            testCase.verifyEqual(pearson(Correlation, A, B), 0.5);
            testCase.verifyEqual(spearman(Correlation, A, B), 0.5);
        end

        function testNonlinearCorrelation(testCase)
            A = [0 10 101 102];
            B = [1 100 500 2000];
            testCase.verifyEqual(pearson(Correlation, A, B), 0.7544, 'AbsTol', 1e-4);
            testCase.verifyEqual(spearman(Correlation, A, B), 1.0, 'AbsTol', 1e-15);
        end

        function testUniformlyRandomCorrelation(testCase)
            c = Correlation(false); % without graphics (default)
            A = randi(100, 100); % uniformly distributed pseudorandom integers
            B = randi(100, 100);
            testCase.verifyEqual(pearson(c, A, B), 0.05, 'RelTol', 10);
            testCase.verifyEqual(spearman(c, A, B), 0.05, 'RelTol', 10);
        end

        function testLargeDemoData(testCase)
            g = GenerateDemoData(1000, 1);
            [X, Y] = g.exponential();
            [A, B] = g.quadratic();
            c = Correlation(false);
            testCase.verifyEqual(pearson(c, X, Y), 0.6, 'RelTol', 10);
            testCase.verifyEqual(pearson(c, A, B), -0.8, 'RelTol', 10);
        end

        function testAnscombesQuartet(testCase)
            % https://en.wikipedia.org/wiki/Anscombe%27s_quartet
            c = Correlation(false);
            test = @(x, y) testCase.verifyEqual(pearson(c, x, y), 0.816, 'RelTol', 0.001);
            X1 = [10 8 13 9 11 14 6 4 12 7 5];
            Y1 = [8.04 6.95 7.58 8.81 8.33 9.96 7.24 4.26 10.84 4.82 5.68];
            test(X1, Y1);
            X2 = [10 8 13 9 11 14 6 4 12 7 5];
            Y2 = [9.14 8.14 8.74 8.77 9.26 8.10 6.13 3.10 9.13 7.26 4.74];
            test(X2, Y2);
            X3 = [10 8 13 9 11 14 6 4 12 7 5];
            Y3 = [7.46 6.77 12.74 7.11 7.81 8.84 6.08 5.39 8.15 6.42 5.73];
            test(X3, Y3);
            X4 = [8 8 8 8 8 8 8 19 8 8 8];
            Y4 = [6.58 5.76 7.71 8.84 8.47 7.04 5.25 12.50 5.56 7.91 6.89];
            test(X4, Y4);
        end
    end

end
