function [ mEpisode ] = MeanEpisodes( mean_r, s )
    
    step = round(numel(mean_r)/s);
    mEpisode = zeros(1, s);
    t = 1;
    for i=1:numel(mean_r)
        mEpisode(t) = mEpisode(t) + mean_r(i);
        if mod(i,step) == 0
            mEpisode(t) = mEpisode(t)/step;
            t = t+1;
        end
    end
end

