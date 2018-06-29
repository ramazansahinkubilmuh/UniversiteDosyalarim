clear in;
in.movieType = 'synthetic';    % generate synthetic video. 
in.method =  @Flow1;       %Locally regularized and vectorized method
in.MaxIterations = 10;
in.bRecordFlow = 1; %record the video (and flow if available)

if in.bRecordFlow %if recording, put time limitation:
   in.endingTime  = 500;
end
in.vidRes  = [128 128];   %video resolution, does not affect file-input(avi or saved-folder)
in.flowRes = [24 24];     %flow resolution
in.targetFramerate = 20;
in.bAutoPlayWithPlayer = 1;
pathToSave = vidProcessing(in);




