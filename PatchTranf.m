classdef PatchTranf
    %PATCHCLASS vectirize a matrix and unvectorize a matrix, storing it's 
    %previous size
    %   Detailed explanation goes here
    
    properties
        Image (:,:)     {mustBeNumeric, mustBeFinite, mustBeNonzero}
        PatchDim (1,2)  {mustBeInteger, mustBeFinite} % I can't specify mustBeNonzero
        X (:,:)
    end
        
    methods (Static) % We are not passing any object of the class, we could
        % define it as private. And we don't use inside our function any
        % attribute from the class
        
        function preProcessed = precut(img, patch)
            preProcessed = double(img); % 1536x679
            [M,N] = size(preProcessed);
            x_p = patch(1,1); %10
            y_p = patch(1,2); % 10
            
            if mod(M, x_p) ~= 0
                a = double(floor(M/x_p))*double(x_p);% 1536/10 = 153,6 -> 153*10 = 1530
                preProcessed = preProcessed(1:a,:);
                fprintf('%d last rows have been eliminated from the image.\n', (M-a));
            end
            
            if mod(N, y_p) ~= 0
                b = double(floor(N/y_p))*double(y_p); % 679/10 = 67,9 -> 67*10 = 670
                preProcessed = preProcessed(:,1:b);
                fprintf('%d last col have been eliminated from the image.\n', (N-b));
            end
            
        end    
    end

    
    methods 
        function obj = PatchTranf(image,patch)
            %PatchTranf Construct an instance of this class
            %   patch must be a (1,2) array
            obj.Image = image;
            obj.PatchDim = patch;
            obj.X = obj.precut(image, patch);
        end
        
        function X_vec = vectorize(obj) 
            %METHOD1 Takes the input image and converts the data matrix
            %into a matrix with M*N rows and x_p*y_p columns.
            %   If the image  it's individsible by the patch dimensions, it
            %   would get rid of the last rows or vectors to make it
            %   divisible.
            
            x_p = obj.PatchDim(1,1);
            y_p = obj.PatchDim(1,2);
            [M,N] = size(obj.X);
            
            % Create the vectors to transform break our image into the patches
            % We have to specify the row dimensions of each patch in a vector
            x_patches = M/x_p; % 153
            y_patches = N/y_p; % 67
            
            row_dim = x_p * ones(1, x_patches); % (1x153)
            col_dim = y_p * ones(1, y_patches); % (1x67) 
            
            % Transform our matriobj.X into a cell Matrix, each cell corresponds to a
            % patch. Matrix: (x_patches, y_patches)
            X_broke = mat2cell(obj.X, row_dim, col_dim); % (153x67) --> celda (10x10)
            
            % We reshape our cell Matrx (X_broke) into a column vector.
            rows = x_patches*y_patches; % 153*67 = 10251
            X_broke_colvec = reshape(X_broke, [rows, 1]); % (10251x1) celdas
            
            % Now we have a cell matrix of (M*N, 1) where each row is a cell.We
            % want to transform each cell of (x_p, y_p) into a row vector
            % (1, x_p*y_p).
            % With the reshape funtion we can not specify one dimension and it will
            % calculate it for us.
            X_broke_vectorized = cellfun(@(xp) reshape(xp,1,[]), X_broke_colvec, 'un', 0); % (10251x100)
            
            % Now we have to convert the (M*N, 1) cell matrix with cells of
            % (1, x_int*y_int) into a matrix again.
            X_vec = cell2mat(X_broke_vectorized);
            
        end
        
        function [X_rec] = recreate(obj, Y)
            %METHOD1 Takes the input image and converts the data matrix
            %into a matrix with M*N rows and x_p*y_p columns.
            %   If the image  it's individsible by the patch dimensions, it
            %   would get rid of the last rows or vectors to make it
            %   divisible.
                        
            x_p = obj.PatchDim(1,1);
            y_p = obj.PatchDim(1,2);
            [M_o,N_o] = size(obj.X);
            
            %  If it was a class we could use the previous dimesions from the image
            %  and the patches previously specified
            [M,N] = size(Y);
            
            % Get the dimension of the original cell matrix
            x_patches = M_o/x_p;
            y_patches = N_o/y_p;
            
            % Create a vector of ones of length M.
            rows_vec = ones(1,M);
            
            % Tranform the matrix to a Cell matrix of (M,1) cells. Cells of (1x100)
            X_vec_cells = mat2cell(Y, rows_vec, N);
            
            % Reshape each cell from the matrix to its original shape. Matrix with
            % dimensions (M,1). Cell if (10x10)
            X_vec_originalcellsdim = cellfun(@(x) reshape(x, x_p, y_p), X_vec_cells, 'un', 0);
            
            % Reshape the cell matrix into it's original shape
            X_broke = reshape(X_vec_originalcellsdim, x_patches, y_patches);
            
            % Transfrom our cells matrix to a normal matrix with the original size.
            X_rec = cell2mat(X_broke);

        end
    end
    
end

