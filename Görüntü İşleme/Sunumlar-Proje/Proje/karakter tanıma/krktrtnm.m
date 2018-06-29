K=im2bw(K);
K=imresize(K,[50,50]);
K=double(K);
K=reshape(K,2500,1);
R=im2bw(R);
R=imresize(R,[50,50]);
R=double(R);
R=reshape(R,2500,1);
giris=zeros(2500,2);
giris(:,1)=K;
giris(:,2)=R;
target=eye(2);
net=newff(minmax(giris),[10 2],{'logsig' 'logsig'},'trainscg');
net.trainParam.perf='sse';
net.trainParam.epochs=500;
net.trainParam.goal=1e-5;
net=train(net,giris,target);
%K=K+rand(50,50)*0.8; K=reshape(K,2500,1); X=sim(net,K) 1 0
