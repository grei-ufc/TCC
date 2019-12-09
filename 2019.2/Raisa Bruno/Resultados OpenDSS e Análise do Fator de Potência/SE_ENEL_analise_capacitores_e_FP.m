clear all
clc

%Transformador da Subestação da Enel (k=0);
f1 = strcat('1_Resultados_sem_geracao/Alimentador_Mon_mon_0_1.csv');
f2 = strcat('2_Resultados_sem_geracao_com_capacitores/Alimentador_Mon_mon_0_1.csv');
f3 = strcat('3_Resultados_com_geracao_0.5/Alimentador_Mon_mon_0_1.csv');
f4 = strcat('4_Resultados_com_geracao_0.5_com_capacitores/Alimentador_Mon_mon_0_1.csv');
f5 = strcat('5_Resultados_com_geracao_1.0/Alimentador_Mon_mon_0_1.csv');
f6 = strcat('6_Resultados_com_geracao_1.0_com_capacitores/Alimentador_Mon_mon_0_1.csv');

MON1 = csvread(f1,1,0);
MON2 = csvread(f2,1,0);
MON3 = csvread(f3,1,0);    
MON4 = csvread(f4,1,0);    
MON5 = csvread(f5,1,0);    
MON6 = csvread(f6,1,0);    

%Cálculo Potências Reativas Capacitivas de Correção
FP_nao_corr = [];
FP_corrigido = [];
f_result = fopen(strcat('RESULTADOS_MATLAB/subestacao_enel.txt'),'w');
for i=1:96
    %Potências reativas capacitivas TRIFÁSICAS
    FP_nao_corr1(i) = MON1(i,3)/sqrt(MON1(i,3)^2 + MON1(i,4)^2);
    FP_corrigido1(i) = MON2(i,3)/sqrt(MON2(i,3)^2 + MON2(i,4)^2);
    
    FP_nao_corr2(i) = MON3(i,3)/sqrt(MON3(i,3)^2 + MON3(i,4)^2);
    FP_corrigido2(i) = MON4(i,3)/sqrt(MON4(i,3)^2 + MON4(i,4)^2);
    
    FP_nao_corr3(i) = MON5(i,3)/sqrt(MON5(i,3)^2 + MON5(i,4)^2);
    FP_corrigido3(i) = MON6(i,3)/sqrt(MON6(i,3)^2 + MON6(i,4)^2);
    
    %Escrevendo para o arquivo TXT
    fprintf(f_result,'Hora[%d] | FP_SEM_GERACAO: %.3f => %.3f |  FP_GERACAO_0.5: %.3f => %.3f |  FP_GERACAO_1.0: %.3f => %.3f \n',i,FP_nao_corr1(i),FP_corrigido1(i),FP_nao_corr2(i),FP_corrigido2(i),FP_nao_corr3(i),FP_corrigido3(i));
end
fclose(f_result);

