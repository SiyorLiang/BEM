function alpha=Malpha(triangles,A,len)
alpha=zeros(len);
for j=1:len
    alpha(:,j)=int_green3d_tri(A,triangles(:,:,j));
end%alpha����û�г�1/4/pi
%normald=alpha\V;%����4pi
%normaldp=normald.*4.*pi;%��׼������
end