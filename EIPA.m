close all

nx = 50;
ny = 50;
x = linspace(0,1,nx*ny);
G = sparse(nx*ny , nx*ny);

%Boundary conditions

for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        
        
        if i == 1 || i == nx
            G(n,n) = 1;
        elseif j == 1 || j == ny
            G(n,n) = 1;
        else
            
            nxm = j+ (i-2)*ny;
            nxp = j+ (i)*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;
%             if (i > 10 && i < 20 && j > 10 && j < 20)
%                 G(n,n) = -2;
%             else
                G(n,n) = -4;
%             end
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
        end
    end
end

figure;
spy(G)

[E,D] = eigs(G,9,'SM');

d = diag(D);
figure;
plot(1:9,d,'x')

eMatrix = zeros(nx,ny);
f = E(:,1);

eMatrix1 = reshape(E(:,1),[nx,ny])*d(1);
eMatrix2 = reshape(E(:,2),[nx,ny])*d(2);
eMatrix3 = reshape(E(:,3),[nx,ny])*d(3);
eMatrix4 = reshape(E(:,4),[nx,ny])*d(4);
eMatrix5 = reshape(E(:,5),[nx,ny])*d(5);
eMatrix6 = reshape(E(:,6),[nx,ny])*d(6);
eMatrix7 = reshape(E(:,7),[nx,ny])*d(7);
eMatrix8 = reshape(E(:,8),[nx,ny])*d(8);
eMatrix9 = reshape(E(:,9),[nx,ny])*d(9);

figure;
subplot(3,3,1)
surf(eMatrix1)
subplot(3,3,2)
surf(eMatrix2)
subplot(3,3,3)
surf(eMatrix3)
subplot(3,3,4)
surf(eMatrix4)
subplot(3,3,5)
surf(eMatrix5)
subplot(3,3,6)
surf(eMatrix6)
subplot(3,3,7)
surf(eMatrix7)
subplot(3,3,8)
surf(eMatrix8)
subplot(3,3,9)
surf(eMatrix9)