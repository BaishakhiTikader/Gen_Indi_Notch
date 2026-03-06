function generate_probability_map(inputFile,nmax,cutoffs,weights)

format long

fileID = fopen(inputFile,'r');
fileID2 = fopen('probability.out','w');

formatSpec = '%f %f %f %f';
sizeA = [5 Inf];

P1 = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);

P1 = P1';
b = size(P1);

range=[max(P1(:,2)) min(P1(:,2)) max(P1(:,3)) min(P1(:,3))];

dm=(range(1)-range(2))/nmax;
dmu=(range(3)-range(4))/nmax;

p_g = ones(nmax+1,nmax+1)*1e-6;
p_total=0;

for i=1:b(1)

    for k=1:size(cutoffs,1)

        if P1(i,2) > cutoffs(k,1) && P1(i,2) < cutoffs(k,2)

            m = fix((P1(i,2)-range(2))/dm)+1;
            mu = fix((P1(i,3)-range(4))/dmu)+1;

            p_g(m,mu)=p_g(m,mu)+weights(k);
            p_total=p_total+weights(k);

        end

    end

end

p_g=p_g/p_total;

m=range(2);

for i=1:nmax
    m=m+dm;
    mu=range(4);

    for j=1:nmax
        mu=mu+dmu;

        if p_g(i,j)>0.00001
            fprintf(fileID2,'%20.10f %20.10f %20.10f\n',m,mu,p_g(i,j));
        end

        fprintf(fileID2,'\n');

    end
end

fclose(fileID2);

xyz=dlmread('probability.out');

x=xyz(:,1);
y=xyz(:,2);
z=-log(xyz(:,3));

[X,Y]=meshgrid(min(x):dm:max(x),min(y):dmu:max(y));
Z=griddata(x,y,z,X,Y);

mymap=[
0.27 0.25 0.43
0.58 0.12 0.71
0.18 0.72 0.11
0.9 0.82 0.71
];

contourf(X,Y,Z,'Fill','on')
colormap(mymap)
shading interp

xlabel('Variable 1')
ylabel('Variable 2')

set(gca,'FontSize',15,'TickDir','out','LineWidth',1.5)

end
