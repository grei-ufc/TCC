%clear all
%clc
nomes_trafos = {};
barras_sec = {};

%Busca os nomes das barras secundárias do arquivo 'trafo.dss'
fileID = fopen('trafo.dss','r');
A = fscanf(fileID, '%c');
B = strsplit(A,'\n');

C = strsplit(char(B(1,1)),' ');
nomes_trafos{1} = C(1,2);
barras_sec{1} = C(1,11);
for i=2:96
    C = strsplit(char(B(1,i)),' ');
    nomes_trafos{i} = C(1,2);
    barras_sec{i} = C(1,10);
end

for i=1:96
    D = strsplit(char(barras_sec{i}),'=');
    barras_sec{i} = D(1,2);
    E = strsplit(char(nomes_trafos{i}),'.');
    nomes_trafos{i} = E(1,2);
    fprintf('%s\n',char(barras_sec{i}));
    fprintf('%s\n',char(nomes_trafos{i}));
end
fclose(fileID);
clear A B C D E fileID i;