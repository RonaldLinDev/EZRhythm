function [softmax1000, state] = piss(imageinput_2, imageinput_1, params, varargin)
%PISS Function implementing an imported ONNX network.
%
% THIS FILE WAS AUTO-GENERATED BY importONNXFunction.
% ONNX Operator Set Version: 8
%
% Variable names in this function are taken from the original ONNX file.
%
% [SOFTMAX1000] = piss(IMAGEINPUT_2, IMAGEINPUT_1, PARAMS)
%			- Evaluates the imported ONNX network PISS with input(s)
%			IMAGEINPUT_2, IMAGEINPUT_1 and the imported network parameters in PARAMS. Returns
%			network output(s) in SOFTMAX1000.
%
% [SOFTMAX1000, STATE] = piss(IMAGEINPUT_2, IMAGEINPUT_1, PARAMS)
%			- Additionally returns state variables in STATE. When training,
%			use this form and set TRAINING to true.
%
% [__] = piss(IMAGEINPUT_2, IMAGEINPUT_1, PARAMS, 'NAME1', VAL1, 'NAME2', VAL2, ...)
%			- Specifies additional name-value pairs described below:
%
% 'Training'
% 			Boolean indicating whether the network is being evaluated for
%			prediction or training. If TRAINING is true, state variables
%			will be updated.
%
% 'InputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			 between the dimensions of the input data and the dimensions of
%			the ONNX model input. For example, the permutation from HWCN
%			(MATLAB standard) to NCHW (ONNX standard) uses the vector
%			[4 3 1 2]. See the documentation for IMPORTONNXFUNCTION for
%			more information about automatic permutation.
%
%			'none' - Input(s) are passed in the ONNX model format. See 'Inputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between input data dimensions and the expected
%			ONNX input dimensions.%
%			cell array - If the network has multiple inputs, each cell
%			contains 'auto', 'none', or a numeric vector.
%
% 'OutputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			between the dimensions of the output and a conventional MATLAB
%			dimension ordering. For example, the permutation from NC (ONNX
%			standard) to CN (MATLAB standard) uses the vector [2 1]. See
%			the documentation for IMPORTONNXFUNCTION for more information
%			about automatic permutation.
%
%			'none' - Return output(s) as given by the ONNX model. See 'Outputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between the ONNX output dimensions and the
%			desired output dimensions.%
%			cell array - If the network has multiple outputs, each cell
%			contains 'auto', 'none' or a numeric vector.
%
% Inputs:
% -------
% IMAGEINPUT_2, IMAGEINPUT_1
%			- Input(s) to the ONNX network.
%			  The input size(s) expected by the ONNX file are:
%				  IMAGEINPUT_2:		[BatchSize, 1, 1, 1]				Type: FLOAT
%				  IMAGEINPUT_1:		[BatchSize, 1, 1, 300]				Type: FLOAT
%			  By default, the function will try to permute the input(s)
%			  into this dimension ordering. If the default is incorrect,
%			  use the 'InputDataPermutation' argument to control the
%			  permutation.
%
%
% PARAMS	- Network parameters returned by 'importONNXFunction'.
%
%
% Outputs:
% --------
% SOFTMAX1000
%			- Output(s) of the ONNX network.
%			  Without permutation, the size(s) of the outputs are:
%				  SOFTMAX1000:		[BatchSize, 6]				Type: FLOAT
%			  By default, the function will try to permute the output(s)
%			  from this dimension ordering into a conventional MATLAB
%			  ordering. If the default is incorrect, use the
%			  'OutputDataPermutation' argument to control the permutation.
%
% STATE		- (Optional) State variables. When TRAINING is true, these will
% 			  have been updated from the original values in PARAMS.State.
%
%
%  See also importONNXFunction

% Preprocess the input data and arguments:
[imageinput_2, imageinput_1, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(imageinput_2, imageinput_1, params, varargin{:});
% Put all variables into a single struct to implement dynamic scoping:
[Vars, NumDims] = packageVariables(params, {'imageinput_2', 'imageinput_1'}, {imageinput_2, imageinput_1}, [4 4]);
% Call the top-level graph function:
[softmax1000, softmax1000NumDims, state] = NetworkGraph1001(imageinput_2, imageinput_1, NumDims.imageinput_2, NumDims.imageinput_1, Vars, NumDims, Training, params.State);
% Postprocess the output data
[softmax1000] = postprocessOutput(softmax1000, outputDataPerms, anyDlarrayInputs, Training, varargin{:});
end

function [softmax1000, softmax1000NumDims1025, state] = NetworkGraph1001(imageinput_2, imageinput_1, imageinput_2NumDims1023, imageinput_1NumDims1024, Vars, NumDims, Training, state)
% Function implementing the graph 'NetworkGraph1001'
% Update Vars and NumDims from the graph's formal input parameters. Note that state variables are already in Vars.
Vars.imageinput_2 = imageinput_2;
NumDims.imageinput_2 = imageinput_2NumDims1023;
Vars.imageinput_1 = imageinput_1;
NumDims.imageinput_1 = imageinput_1NumDims1024;

% Execute the operators:
% Sub:
Vars.imageinput_2_Sub = Vars.imageinput_2 - Vars.imageinput_2_Mean;
NumDims.imageinput_2_Sub = max(NumDims.imageinput_2, NumDims.imageinput_2_Mean);

% Conv:
[weights, bias, stride, dilationFactor, padding, dataFormat, NumDims.fc_3] = prepareConvArgs(Vars.fc_3_W, Vars.fc_3_B, Vars.ConvStride1002, Vars.ConvDilationFactor1003, Vars.ConvPadding1004, 1, NumDims.imageinput_2_Sub, NumDims.fc_3_W);
Vars.fc_3 = dlconv(Vars.imageinput_2_Sub, weights, bias, 'Stride', stride, 'DilationFactor', dilationFactor, 'Padding', padding, 'DataFormat', dataFormat);

% Sub:
Vars.imageinput_1_Sub = Vars.imageinput_1 - Vars.imageinput_1_Mean;
NumDims.imageinput_1_Sub = max(NumDims.imageinput_1, NumDims.imageinput_1_Mean);

% Conv:
[weights, bias, stride, dilationFactor, padding, dataFormat, NumDims.conv_2] = prepareConvArgs(Vars.conv_2_W, Vars.conv_2_B, Vars.ConvStride1005, Vars.ConvDilationFactor1006, Vars.ConvPadding1007, 1, NumDims.imageinput_1_Sub, NumDims.conv_2_W);
Vars.conv_2 = dlconv(Vars.imageinput_1_Sub, weights, bias, 'Stride', stride, 'DilationFactor', dilationFactor, 'Padding', padding, 'DataFormat', dataFormat);

% MaxPool:
[poolsize, stride, padding, dataFormat, NumDims.maxpool_1] = prepareMaxPool8Args(Vars.MaxPoolPoolSize1008, Vars.MaxPoolStride1009, Vars.MaxPoolPadding1010, NumDims.conv_2);
Vars.maxpool_1 = maxpool(Vars.conv_2, poolsize, 'Stride', stride, 'Padding', padding, 'DataFormat', dataFormat);

% Relu:
Vars.relu_1 = relu(Vars.maxpool_1);
NumDims.relu_1 = NumDims.maxpool_1;

% Conv:
[weights, bias, stride, dilationFactor, padding, dataFormat, NumDims.conv_1] = prepareConvArgs(Vars.conv_1_W, Vars.conv_1_B, Vars.ConvStride1011, Vars.ConvDilationFactor1012, Vars.ConvPadding1013, 1, NumDims.relu_1, NumDims.conv_1_W);
Vars.conv_1 = dlconv(Vars.relu_1, weights, bias, 'Stride', stride, 'DilationFactor', dilationFactor, 'Padding', padding, 'DataFormat', dataFormat);

% MaxPool:
[poolsize, stride, padding, dataFormat, NumDims.maxpool_2] = prepareMaxPool8Args(Vars.MaxPoolPoolSize1014, Vars.MaxPoolStride1015, Vars.MaxPoolPadding1016, NumDims.conv_1);
Vars.maxpool_2 = maxpool(Vars.conv_1, poolsize, 'Stride', stride, 'Padding', padding, 'DataFormat', dataFormat);

% Relu:
Vars.relu_2 = relu(Vars.maxpool_2);
NumDims.relu_2 = NumDims.maxpool_2;

% Concat:
[Vars.concat, NumDims.concat] = onnxConcat(3, {Vars.relu_2, Vars.fc_3}, [NumDims.relu_2, NumDims.fc_3]);

% Conv:
[weights, bias, stride, dilationFactor, padding, dataFormat, NumDims.fc_2] = prepareConvArgs(Vars.fc_2_W, Vars.fc_2_B, Vars.ConvStride1017, Vars.ConvDilationFactor1018, Vars.ConvPadding1019, 1, NumDims.concat, NumDims.fc_2_W);
Vars.fc_2 = dlconv(Vars.concat, weights, bias, 'Stride', stride, 'DilationFactor', dilationFactor, 'Padding', padding, 'DataFormat', dataFormat);

% Relu:
Vars.relu_3 = relu(Vars.fc_2);
NumDims.relu_3 = NumDims.fc_2;

% Conv:
[weights, bias, stride, dilationFactor, padding, dataFormat, NumDims.fc_1] = prepareConvArgs(Vars.fc_1_W, Vars.fc_1_B, Vars.ConvStride1020, Vars.ConvDilationFactor1021, Vars.ConvPadding1022, 1, NumDims.relu_3, NumDims.fc_1_W);
Vars.fc_1 = dlconv(Vars.relu_3, weights, bias, 'Stride', stride, 'DilationFactor', dilationFactor, 'Padding', padding, 'DataFormat', dataFormat);

% Flatten:
[dim1, dim2, NumDims.softmax_Flatten] = prepareFlattenArgs(Vars.fc_1, 1, NumDims.fc_1);
Vars.softmax_Flatten = reshape(Vars.fc_1, dim1, dim2);

% Softmax:
[dim1, dim2, origSize, NumDims.softmax1000] = prepareSoftmaxArgs(Vars.softmax_Flatten, 1, NumDims.softmax_Flatten);
Vars.softmax1000 = reshape(Vars.softmax_Flatten, dim1, dim2);
Vars.softmax1000 = softmax(Vars.softmax1000, 'DataFormat', 'CB');
Vars.softmax1000 = reshape(Vars.softmax1000, origSize);

% Set graph output arguments from Vars and NumDims:
softmax1000 = Vars.softmax1000;
softmax1000NumDims1025 = NumDims.softmax1000;
% Set output state from Vars:
state = updateStruct(state, Vars);
end

function [inputDataPerms, outputDataPerms, Training] = parseInputs(imageinput_2, imageinput_1, numDataOutputs, params, varargin)
% Function to validate inputs to piss:
p = inputParser;
isValidArrayInput = @(x)isnumeric(x) || isstring(x);
isValidONNXParameters = @(x)isa(x, 'ONNXParameters');
addRequired(p, 'imageinput_2', isValidArrayInput);
addRequired(p, 'imageinput_1', isValidArrayInput);
addRequired(p, 'params', isValidONNXParameters);
addParameter(p, 'InputDataPermutation', 'auto');
addParameter(p, 'OutputDataPermutation', 'auto');
addParameter(p, 'Training', false);
parse(p, imageinput_2, imageinput_1, params, varargin{:});
inputDataPerms = p.Results.InputDataPermutation;
outputDataPerms = p.Results.OutputDataPermutation;
Training = p.Results.Training;
if isnumeric(inputDataPerms)
    inputDataPerms = {inputDataPerms};
end
if isstring(inputDataPerms) && isscalar(inputDataPerms) || ischar(inputDataPerms)
    inputDataPerms = repmat({inputDataPerms},1,2);
end
if isnumeric(outputDataPerms)
    outputDataPerms = {outputDataPerms};
end
if isstring(outputDataPerms) && isscalar(outputDataPerms) || ischar(outputDataPerms)
    outputDataPerms = repmat({outputDataPerms},1,numDataOutputs);
end
end

function [imageinput_2, imageinput_1, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(imageinput_2, imageinput_1, params, varargin)
% Parse input arguments
[inputDataPerms, outputDataPerms, Training] = parseInputs(imageinput_2, imageinput_1, 1, params, varargin{:});
anyDlarrayInputs = any(cellfun(@(x)isa(x, 'dlarray'), {imageinput_2, imageinput_1}));
% Make the input variables into unlabelled dlarrays:
imageinput_2 = makeUnlabeledDlarray(imageinput_2);
imageinput_1 = makeUnlabeledDlarray(imageinput_1);
% Permute inputs if requested:
imageinput_2 = permuteInputVar(imageinput_2, inputDataPerms{1}, 4);
imageinput_1 = permuteInputVar(imageinput_1, inputDataPerms{2}, 4);
% Check input size(s):
checkInputSize(size(imageinput_2), {'BatchSize' 1 1 1}, "imageinput_2");
checkInputSize(size(imageinput_1), {'BatchSize' 1 1 300}, "imageinput_1");
end

function [softmax1000] = postprocessOutput(softmax1000, outputDataPerms, anyDlarrayInputs, Training, varargin)
% Set output type:
if ~anyDlarrayInputs && ~Training
    if isdlarray(softmax1000)
        softmax1000 = extractdata(softmax1000);
    end
end
% Permute outputs if requested:
softmax1000 = permuteOutputVar(softmax1000, outputDataPerms{1}, 2);
end


%% dlarray functions implementing ONNX operators:

function [Y, numDimsY] = onnxConcat(ONNXAxis, XCell, numDimsXArray)
% Concatentation that treats all empties the same. Necessary because
% dlarray.cat does not allow, for example, cat(1, 1x1, 1x0) because the
% second dimension sizes do not match.
numDimsY = numDimsXArray(1);
XCell(cellfun(@isempty, XCell)) = [];
if isempty(XCell)
    Y = dlarray([]);
else
    if ONNXAxis<0
        ONNXAxis = ONNXAxis + numDimsY;
    end
    DLTAxis = numDimsY - ONNXAxis;
    Y = cat(DLTAxis, XCell{:});
end
end

function [weights, bias, stride, dilationFactor, padding, dataFormat, numDimsY] = prepareConvArgs(...
    weights, bias, stride, dilationFactor, padding, numWtGroups, numDimsX, numDimsW)
% Prepares arguments for implementing the ONNX Conv operator

% Weights: The ONNX weight dim is Fcxyz..., where c=C/G, G is numGroups,
% and xyz... are spatial dimensions. DLT "weights" here is the flip of
% that, or ...zyxcF. dlconv requires ...zyxcfG, where f=F/G. So reshape to
% split the last dimension.
sizeW    = size(weights, 1:numDimsW);
F        = sizeW(end);
newWSize = [sizeW(1:numDimsW-1), F/numWtGroups, numWtGroups];
weights  = reshape(weights, newWSize);
% bias
if isempty(bias)
    bias = 0;
end
bias = dlarray(bias(:),'CU');
% Derive missing default attributes from weight tensor
numSpatialDims = numDimsW-2;
if isempty(padding)
    padding = zeros(1, 2*numSpatialDims);
end
if isempty(stride)
    stride = ones(1,numSpatialDims);
end
if isempty(dilationFactor)
    dilationFactor = ones(1,numSpatialDims);
end
% Make the attributes non-dlarrays:
if isa(stride, 'dlarray')
    stride = extractdata(stride);
end
if isa(dilationFactor, 'dlarray')
    dilationFactor = extractdata(dilationFactor);
end
if isa(padding, 'dlarray')
    padding = extractdata(padding);
end
% Make the attributes double row vectors, and flip their dimension ordering
% to reverse-onnx:
stride = fliplr(double(stride(:)'));
dilationFactor = fliplr(double(dilationFactor(:)'));
if isnumeric(padding)       % padding can be "same"
    % ONNX: [x1_begin, ..., xn_begin, x1_end, ...,xn_end]
    % DLT:  [xn_begin, ..., x1_begin;
    %        xn_end, ..., x1_end]       (Note the lrflip and semicolon)
    padding = fliplr(transpose(reshape(padding, [], 2)));
end
% Set dataformat and numdims
dataFormat = [repmat('S', 1, numDimsX-2) 'CB'];
numDimsY = numDimsX;
end

function [dim1, dim2, numDimsY] = prepareFlattenArgs(X, ONNXAxis, numDimsX)
% Prepares arguments for implementing the ONNX Flatten operator

% ONNXAxis is the number of dimensions that go on the left in ONNX, so here
% it is the number of dimensions that go on the right.
if ONNXAxis < 0
    ONNXAxis = ONNXAxis + numDimsX;
end
if ONNXAxis == 0
    dim2 = 1;
else
    dim2 = prod(size(X, numDimsX+1-ONNXAxis:numDimsX));     % numel on the right
end
dim1 = numel(X)/dim2;                                   % numel on the left
numDimsY = 2;
end

function [poolsize, stride, padding, dataFormat, numDimsY, numDimsIndices] = prepareMaxPool8Args(poolsize, stride, padding, numDimsX)
% Prepares arguments for implementing the ONNX MaxPool-8 operator
poolsize    = fliplr(extractdata(poolsize(:)'));
stride      = fliplr(extractdata(stride(:)'));
% padding
if isa(padding, 'dlarray')
    padding = extractdata(padding);
end
if isnumeric(padding)
    % ONNX: [x1_begin, ..., xn_begin, x1_end, ...,xn_end]
    % DLT:  [xn_begin, ..., x1_begin;
    %        xn_end, ..., x1_end]       (Note the lrflip and semicolon)
    padding = fliplr(transpose(reshape(padding, [], 2)));
end
dataFormat  = [repmat('S', 1, numDimsX-2) 'CB'];
numDimsY    = numDimsX;
numDimsIndices = numDimsX;                      % New in opset 8
end

function [dim1, dim2, origSize, numDimsX] = prepareSoftmaxArgs(X, ONNXAxis, numDimsX)
% Prepares arguments for implementing the ONNX Softmax operator
if ONNXAxis<0
    ONNXAxis = ONNXAxis + numDimsX;
end
dim2     = prod(size(X, numDimsX+1-ONNXAxis:numDimsX));   % numel on the right
dim1     = numel(X)/dim2;                                 % numel on the left
origSize = size(X);
end

%% Utility functions:

function s = appendStructs(varargin)
% s = appendStructs(s1, s2,...). Assign all fields in s1, s2,... into s.
if isempty(varargin)
    s = struct;
else
    s = varargin{1};
    for i = 2:numel(varargin)
        fromstr = varargin{i};
        fs = fieldnames(fromstr);
        for j = 1:numel(fs)
            s.(fs{j}) = fromstr.(fs{j});
        end
    end
end
end

function checkInputSize(inputShape, expectedShape, inputName)

if numel(expectedShape)==0
    % The input is a scalar
    if ~isequal(inputShape, [1 1])
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, "[1,1]", inputSizeStr));
    end
elseif numel(expectedShape)==1
    % The input is a vector
    if ~shapeIsColumnVector(inputShape) || ~iSizesMatch({inputShape(1)}, expectedShape)
        expectedShape{2} = 1;
        expectedSizeStr = makeSizeString(expectedShape);
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
else
    % The input has 2 dimensions or more
    
    % The input dimensions have been reversed; flip them back to compare to the
    % expected ONNX shape.
    inputShape = fliplr(inputShape);
    
    % If the expected shape has fewer dims than the input shape, error.
    if numel(expectedShape) < numel(inputShape)
        expectedSizeStr = strjoin(["[", strjoin(string(expectedShape), ","), "]"], "");
        error(message('nnet_cnn_onnx:onnx:InputHasGreaterNDims', inputName, expectedSizeStr));
    end
    
    % Prepad the input shape with trailing ones up to the number of elements in
    % expectedShape
    inputShape = num2cell([ones(1, numel(expectedShape) - length(inputShape)) inputShape]);
    
    % Find the number of variable size dimensions in the expected shape
    numVariableInputs = sum(cellfun(@(x) isa(x, 'char') || isa(x, 'string'), expectedShape));
    
    % Find the number of input dimensions that are not in the expected shape
    % and cannot be represented by a variable dimension
    nonMatchingInputDims = setdiff(string(inputShape), string(expectedShape));
    numNonMatchingInputDims  = numel(nonMatchingInputDims) - numVariableInputs;
    
    expectedSizeStr = makeSizeString(expectedShape);
    inputSizeStr = makeSizeString(inputShape);
    if numNonMatchingInputDims == 0 && ~iSizesMatch(inputShape, expectedShape)
        % The actual and expected input dimensions match, but in
        % a different order. The input needs to be permuted.
        error(message('nnet_cnn_onnx:onnx:InputNeedsPermute',inputName, expectedSizeStr, inputSizeStr));
    elseif numNonMatchingInputDims > 0
        % The actual and expected input sizes do not match.
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
end
end

function doesMatch = iSizesMatch(inputShape, expectedShape)
% Check whether the input and expected shapes match, in order.
% Size elements match if (1) the elements are equal, or (2) the expected
% size element is a variable (represented by a character vector or string)
doesMatch = true;
for i=1:numel(inputShape)
    if ~(isequal(inputShape{i},expectedShape{i}) || ischar(expectedShape{i}) || isstring(expectedShape{i}))
        doesMatch = false;
        return
    end
end
end

function sizeStr = makeSizeString(shape)
sizeStr = strjoin(["[", strjoin(string(shape), ","), "]"], "");
end

function isVec = shapeIsColumnVector(shape)
if numel(shape) == 2 && shape(2) == 1
    isVec = true;
else
    isVec = false;
end
end
function X = makeUnlabeledDlarray(X)
% Make numeric X into an unlabelled dlarray
if isa(X, 'dlarray')
    X = stripdims(X);
elseif isnumeric(X)
    if isinteger(X)
        % Make ints double so they can combine with anything without
        % reducing precision
        X = double(X);
    end
    X = dlarray(X);
end
end

function [Vars, NumDims] = packageVariables(params, inputNames, inputValues, inputNumDims)
% inputNames, inputValues are cell arrays. inputRanks is a numeric vector.
Vars = appendStructs(params.Learnables, params.Nonlearnables, params.State);
NumDims = params.NumDimensions;
% Add graph inputs
for i = 1:numel(inputNames)
    Vars.(inputNames{i}) = inputValues{i};
    NumDims.(inputNames{i}) = inputNumDims(i);
end
end

function X = permuteInputVar(X, userDataPerm, onnxNDims)
% Returns reverse-ONNX ordering
if onnxNDims == 0
    return;
elseif onnxNDims == 1 && isvector(X)
    X = X(:);
    return;
elseif isnumeric(userDataPerm)
    % Permute into reverse ONNX ordering
    if numel(userDataPerm) ~= onnxNDims
        error(message('nnet_cnn_onnx:onnx:InputPermutationSize', numel(userDataPerm), onnxNDims));
    end
    perm = fliplr(userDataPerm);
elseif isequal(userDataPerm, 'auto') && onnxNDims == 4
    % Permute MATLAB HWCN to reverse onnx (WHCN)
    perm = [2 1 3 4];
elseif isequal(userDataPerm, 'as-is')
    % Do not permute the input
    perm = 1:ndims(X);
else
    % userDataPerm is either 'none' or 'auto' with no default, which means
    % it's already in onnx ordering, so just make it reverse onnx
    perm = max(2,onnxNDims):-1:1;
end
X = permute(X, perm);
end

function Y = permuteOutputVar(Y, userDataPerm, onnxNDims)
switch onnxNDims
    case 0
        perm = [];
    case 1
        if isnumeric(userDataPerm)
            % Use the user's permutation because Y is a column vector which
            % already matches ONNX.
            perm = userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            % Treat the 1D onnx vector as a 2D column and transpose it
            perm = [2 1];
        else
            % userDataPerm is 'none'. Leave Y alone because it already
            % matches onnx.
            perm = [];
        end
    otherwise
        % ndims >= 2
        if isnumeric(userDataPerm)
            % Use the inverse of the user's permutation. This is not just the
            % flip of the permutation vector.
            perm = onnxNDims + 1 - userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            if onnxNDims == 2
                % Permute reverse ONNX CN to DLT CN (do nothing)
                perm = [];
            elseif onnxNDims == 4
                % Permute reverse onnx (WHCN) to MATLAB HWCN
                perm = [2 1 3 4];
            else
                % User wants the output in ONNX ordering, so just reverse it from
                % reverse onnx
                perm = onnxNDims:-1:1;
            end
        elseif isequal(userDataPerm, 'as-is')
            % Do not permute the input
            perm = 1:ndims(Y);
        else
            % userDataPerm is 'none', so just make it reverse onnx
            perm = onnxNDims:-1:1;
        end
end
if ~isempty(perm)
    Y = permute(Y, perm);
end
end

function s = updateStruct(s, t)
% Set all existing fields in s from fields in t, ignoring extra fields in t.
for name = transpose(fieldnames(s))
    s.(name{1}) = t.(name{1});
end
end
