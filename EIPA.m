close all

nx = 50;
ny = 50;
x = linspace(0,1,nx*ny);
G = zeros(nx*ny , nx*ny);

%Boundary conditions
for m = 1:nx*ny
    G(m,:) = 0;
    G(m,m) = 1;
end

% for i = 1:1000
%     for n=2:1:nx*ny-1
%         for m=2:1:nx*ny-1
%             G(m,n)= (G(m+1,n)+G(m-1,n)+ G(m,n+1)+G(m,n-1))/4;
%         end
%     end
% end

figure;
spy(G)

[E,D] = eigs(G,9,'SM');

[Ds,Pr] = sort(diag(D));
D = D(Pr,Pr);
E = E(:,Pr);
figure;

plot(x,E(:,1:5))

% figure;
% M = zeros(nx,ny);
% 
% R = reshape(E,[nx,ny]);
% surf(R)