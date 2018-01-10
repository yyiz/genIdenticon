clear; clc; close all;

%TODO: set imname to filename of image you want masked
%Make sure image is square
imname = 'pic.jpg';

%TODO: set git_user to git username, used to obtain identicon from hash
git_user = 'yyiz';
outImName = 'outIm.png';

%% Constants:
outImSize = 460;
identiconSize = 420;
borderSize = 35;
imLim = identiconSize - borderSize;
midPts = 25:70:350; % Test whether identicon grid is 0 or 1 (since 5x5)
maskRow = 5;
maskSize = maskRow * maskRow;
repTimes = outImSize / maskRow;
grayVal = 240;
rgbSize = 3;

%% Parse identicon for 5x5 binary image
identiconIm = imread(sprintf('https://github.com/identicons/%s.png', git_user));
orig = imresize(double(imread(imname)), [outImSize, outImSize]);

identiconIm = identiconIm(borderSize:imLim, borderSize:imLim);

[X, Y] = meshgrid(midPts, midPts);
X = reshape(X, 1, maskSize);
Y = reshape(Y, 1, maskSize);
idx = sub2ind(size(identiconIm), Y, X);
identicon = identiconIm(idx) == grayVal;
identicon = ~reshape(identicon, maskRow, maskRow);

%% Mask away image from binary identicon
identicon = repelem(identicon, repTimes, repTimes);
identicon = repmat(identicon, 1, 1, rgbSize);
gray = (~identicon) * grayVal;
masked = uint8((identicon .* orig) + gray);
imshow(masked);
imwrite(masked, outImName);
