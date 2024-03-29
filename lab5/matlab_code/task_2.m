% transfer functions
W1 = [
    tf([2,5],[1,1,7]), tf([5],[1,7,7]), tf([10,1],[1,2,1]), tf([5],[1,7]), tf([2,5],[1,1,7]);
    tf([3,5],[1,2,5]), tf([5],[1,10]), tf([2,5],[1,1,7]), tf([5],[1,2,7]), tf([2],[1,1,7]);
    tf([1,1],[1,1,1]), tf([1,3],[1,20,7]), tf([10],[1,70,7]), tf([1,1],[1,1,5]), tf([10,0],[2,20,7]);
    tf([2,5],[1,1,7]), tf([5],[1,7,1]), tf([5],[1,1,7]), tf([2,0],[1,1,7]), tf([1,0],[1,1,7]);
     ];
W2 = [
    tf([1,5],[1,1,10]), tf([2,-5],[1,1,14]), tf([1,1],[1,3,10]), tf([1,7],[1,7,7]);
    tf([1,5],[1,10,1]), tf([2,5],[1,7,1]), tf([1,15],[1,7,1]), tf([9,1],[1,7,1]);
    tf([2,5],[1,1,1]), tf([1,5],[1,1,1]), tf([1,1],[1,10,1]), tf([7,7],[1,7,1]);
    tf([5],[1,7]), tf([2,5],[1,1,7]), tf([2,5],[1,1,10]), tf([2,10],[1,1,7]);
    tf([2,5],[1,1,7]), tf([2,5],[1,0.3,7]), tf([1],[1,0.2,1]), tf([1],[1,1]);
    ];
% plot amplitude frequency response
% ampW1 = bodeplot(W1);
% setoptions(ampW1,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off', 'IOGrouping','all');
% xlim([0 10]);
% ampW2 = bodeplot(W2);
% setoptions(ampW2,'FreqScale','linear','MagUnits','abs','Grid','on','PhaseVisible','off','IOGrouping','all');
% xlim([0 10]);

% plot singular values to frequency
% sinValW1 = sigmaplot(W1);
% setoptions(sinValW1,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 6]);
% sinValW2 = sigmaplot(W2);
% setoptions(sinValW2,'FreqScale','linear','MagUnits','abs','Grid','on');
% xlim([0 6]);

% find h_inf norm
getPeakGain(W1)
getPeakGain(W2)

% find h_2 norm
norm(W1)
norm(W2)