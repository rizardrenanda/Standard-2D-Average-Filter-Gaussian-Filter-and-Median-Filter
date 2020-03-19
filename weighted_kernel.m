function kernel = weighted_kernel(kernel_size)
% Find kernel for weighted average filter 
% Input : kernel size
% Output :  weighted kernel
%           example : kernel_size=3 -> kernel= [1 2 1; 2 4 2; 1 2 1]
%                     kernel_size=5 -> kernel=[1 4 6 4 1;
%                                              4 16 24 16 4;
%                                              6 24 36 24 6;
%                                              4 16 24 16 4;
%                                              1 4 6 4 1]  
n=kernel_size;

%find the pascal triangle number
%for example:   n=3 -> vect= 1 2 1
%               n=4 -> vect= 1 3 3 1
%               n=5 -> vect= 1 4 6 4 1 ; etc
vect=zeros([n 1]);
norm=0;
for i=1:n
    vect(i)=nchoosek(n-1,i-1);
end

kernel=(vect*transpose(vect));
%Normalize kernel
kernel=kernel/sum(kernel(:));
