function probability_map(inputFile, outputFile, colX, colY, nBins, cutoffs, weights)

clc;
format long

data = load(inputFile);

x = data(:,colX);
y = data(:,colY);

range = [max(x) min(x) max(y) min(y)];

dx = (range(1)-range(2))/nBins;
dy = (range(3)-range(4))/nBins;

p_g = ones(nBins+1,nBins+1)*1e-6;
p_total = 0;

for i=1:length(x)

    for k = 1:size(cutoffs,1)

        if x(i) > cutoffs(k,1) && x(i) < cutoffs(k,2)

            ix = fix((x(i)-range(2))/dx)+1;
            iy = fix((y(i)-range(4))/dy)+1;

            p_g(ix,iy) = p_g(ix,iy) + weights(k);
            p_total = p_total + weights(k);

        end

    end

end

p_g = p_g/p_total;

xyz = dlmread(outputFile);

x = xyz(:,1);
y = xyz(:,2);
z = -log(xyz(:,3));

[X,Y] = meshgrid(min(x):dx:max(x),min(y):dy:max(y));
Z = griddata(x,y,z,X,Y);

mymap = [
0.27 0.25 0.43;
0.58 0.12 0.71;
0.18 0.72 0.11;
0.9 0.82 0.71
];

contourf(X,Y,Z,'Fill','on')
colormap(mymap)
shading interp

xlabel('Variable 1')
ylabel('Variable 2')

set(gca,'FontSize',15,'TickDir','out','LineWidth',1.5)

end
