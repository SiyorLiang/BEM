function pb=PotentialBasis(path, xr, yr, zr)
    file=[path '-' DataHash([xr yr zr]) '.mat'];
    if exist(file,'file')==2
        load(file);
        return;
    end
    [cb,triangles] = ChargeBasis(path);
    [y,z,x]=meshgrid(linspace(yr(1),yr(2),yr(3)+1),linspace(zr(1),zr(2),zr(3)+1),linspace(xr(1),xr(2),xr(3)+1));
    nop=[numel(x) 1];
    points=[reshape(x,nop) reshape(y,nop) reshape(z,nop)];
    noe=size(cb,2);
    parfor k=1:noe
        [pot,fx,fy,fz]=Potential(triangles,cb(:,k),points);
        pb(:,:,k)=[pot;fx;fy;fz];
    end
    save(file,'pb');
end