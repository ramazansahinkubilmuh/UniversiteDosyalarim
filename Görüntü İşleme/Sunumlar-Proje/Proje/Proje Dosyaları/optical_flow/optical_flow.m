function [output] = optical_flow(video, options)
t = tic;
position = [];
velocity = [];
if nargin == 0
    display('running demo...')
    display('loading video...')
    try
    load deneme
    catch
        display('missing demo file "cat_video.mat"')
        display('demo aborted.')
        return
    end
    video = single(video);
end

if size(video,3) < 2
    error('need at least 2 image frames for optical flow algorithm to operate')
end

if nargin < 2
    x_blk_size = floor(.04*size(video,2));
    y_blk_size = floor(.04*size(video,1));
else
    
    if ~isfield(options,'x_blk_size')
        x_blk_size = floor(.04*size(video,2));
        display(sprintf('no x_blk_size options found, using %g',x_blk_size))
    end
    
     if ~isfield(options,'y_blk_size')
         
        y_blk_size = floor(.04*size(video,1));
        display(sprintf('no x_blk_size options found, using %g',y_blk_size))
     end
    
    if ~isfield(options,'displayResults')
        displayResults = 0;
    end
end

nframe = 20;

for iframe = 1:nframe-1
    display(sprintf('processing frame: %g of %g...',iframe,nframe-1))
    
    frame1 = squeeze(video(:,:,iframe));
    frame2 = squeeze(video(:,:,iframe+1));
    %--------------------------------------------------------------------------
    %  Pozisyona göre görüntülerin deðiþimini hesapla
    [Ix,Iy] = gradient(frame1);
    [ny, nx] = size(Ix);
    %--------------------------------------------------------------------------
    % En yakýn kareleri kullanarak zamana göre görüntüdeki deðiþikliði hesapla
    It = frame2-frame1;
    
    %--------------------------------------------------------------------------
    % Sayacý baþlat
    ct = 1;
    
    %--------------------------------------------------------------------------
    % Birinci blokun x aralÄ±ÄŸÄ±nÄ± hesapla
    x1 = 1;
    x2 = x1+x_blk_size;
    
    %--------------------------------------------------------------------------
    % X ve y yÃ¶nÃ¼ndeki adÄ±mlarÄ± hesapla
    xs = floor((nx-x_blk_size)/x_blk_size);
    ys = floor((ny-y_blk_size)/y_blk_size);
    
    %--------------------------------------------------------------------------
    % Hýz vektölerini baþlatýr
    % Vx, vy, hýz vektörlerinin x bileþenlerini depolamak için kullanýlýr ve
    % Y-bileþenlerini sýrasýyla göstermektedir.
    vx = zeros(1,ys*xs);
    vy = zeros(1,ys*xs);
    
    %--------------------------------------------------------------------------
    % Konum vektörlerini baslatýr
    % X, y, optik hesaplamak için kullanýlan bloðun merkez konumunu depolar
    % Akýþ deðerleri.
    x = zeros(1,ys*xs);
    y = zeros(1,ys*xs);
    
    
    %--------------------------------------------------------------------------
    % Resim boyunca dongü
    for ix = 1:xs
        
        y1 = 1;
        y2 = y1 + y_blk_size;
        
        for iy = 1:ys
            
            %------------------------------------------------------------------
            % Gerçekleþtirmek için degrade ve fark görüntüsünden bir alt etki alaný seçin
            % Üzerinde hesaplama
            
            Ix_block = Ix(y1:y2,x1:x2);
            Iy_block = Iy(y1:y2,x1:x2);
            It_block = It(y1:y2,x1:x2);
            
            
            %------------------------------------------------------------------
            % Problemi doðrusal denklem olarak dÃ¶kÃ¼n ve bir lsqr anlamda Ã§Ã¶zmek
            % Bu yaklaÅŸÄ±m Lucas-Kanade Metodu olarak bilinir
            % A*u = f
            % A'*A*u = A'*f
            % u = inv(A'*A)*A*f
            % solve inv(A'*A) using pseudo-inv (pinv)
            % f -> It  (Imge zamanÄ±na gÃ¶re deÄŸiÅŸimi)
            % A -> [Ix,Iy] (Pozisyona gÃ¶re imaj deÄŸiÅŸikliÄŸi)
            % u -> [vx,vy] (HÄ±zlarÄ±, ne iÃ§in Ã§Ã¶zmek istediÄŸimiz)
            
            A = [Ix_block(:) , Iy_block(:)];
            b = -It_block(:);
            
            A = A(1:1:end,:);
            b = b(1:1:end);
            
            P = pinv(A'*A);
            u = P*A'*b;
            
            %------------------------------------------------------------------
            % Mevcut alt alana gÃ¶receli hÄ±zlar.
            %
            % Not: bunu gerÃ§ek bir hÄ±za (Ã¶r. [M / s] yapardÄ±n
            % Ã‡erÃ§eveler arasÄ±ndaki oran hakkÄ±nda bilgi iÃ§ermesi gerekir
            % (delta-t) Ve iÃ§indeki komÅŸu pikseller arasÄ±ndaki mesafe
            % GÃ¶rÃ¼ntÃ¼ler (delta-x, delta-y). Aksi takdirde sonuÃ§ bir
            % GÃ¶receli hÄ±z.
            vx(ct) = u(1);
            vy(ct) = u(2);
            
            %------------------------------------------------------------------
            % Alt alanÄ±n orta noktasÄ±nÄ± hesapla
            y(ct) = (x1+x2)/2;
            x(ct) = (y1+y2)/2;
            
            ct = ct+1;
            
            %------------------------------------------------------------------
            % Yeni bloÄŸun y aralÄ±ÄŸÄ±nÄ± elde
            y1 = y1 + y_blk_size + 1;
            y2 = y1 + y_blk_size;
            
            %------------------------------------------------------------------
            % Y yÃ¶nÃ¼ndeki gÃ¶rÃ¼ntÃ¼ boyutunu aÅŸmadÄ±ÄŸÄ±nÄ±zdan emin olun
            if y2 > ny
                y2  = ny;
            end
        end
        %----------------------------------------------------------------------
        % Yeni bloÄŸun x aralÄ±ÄŸÄ±nÄ± elde et
        x1 = x1 + x_blk_size + 1;
        x2 = x1 + x_blk_size;
        %----------------------------------------------------------------------
        % X yÃ¶nÃ¼nde gÃ¶rÃ¼ntÃ¼ boyutunu aÅŸmadÄ±ÄŸÄ±nÄ±zdan emin olun
        if x2 > nx
            x2 = nx;
        end
    end
    
    position(iframe,:,:) = [y ; x];
    velocity(iframe,:,:) = [vy ; vx];
    x = [];
    y = [];
    vx = [];
    vy = [];
    ct = 1;
    
end
%--------------------------------------------------------------------------
% Girdi baÄŸÄ±msÄ±z deÄŸiÅŸkeni yoksa, arsa sonuÃ§larÄ±
if nargin == 0 || options.displayResults
    figure   
    for iframe = 1:size(velocity,1);
        subplot(1,1,1)
        imagesc(squeeze(video(:,:,iframe+1))),colormap gray
        title(sprintf('velocity vectors + image\n frame %g',iframe))
        hold on
        x = squeeze(position(iframe,2,:));
        y = squeeze(position(iframe,1,:));
        vx = squeeze(velocity(iframe,2,:));
        vy = squeeze(velocity(iframe,1,:));
        plot(y,x,'.k','markersize',1)
        quiver(y,x,vy,vx,'r'), hold off
        
        drawnow
        pause(.1)
    end
end
output.position = position;
output.velocity = velocity;
output.num_blks_x = xs;
output.num_blks_y = ys;
output.blk_size_x = x_blk_size;
output.blk_size_y = y_blk_size;
output.nframes = nframe;
output.process_time = sprintf('%3.2f [sec]',toc(t));
