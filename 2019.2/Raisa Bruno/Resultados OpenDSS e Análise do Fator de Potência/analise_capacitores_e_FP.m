clc
clear all

%Capacitores Adotados (trifásico)
Kvar_adotado = [43,33,23,48,31,26,41,16,32,17.9,15,0,19,0,43,21,3,8,2.4,11,46,12,21,0,16,17,5.9,17,26,11,0,20,18,9,16,31,30,17.8,18,39,0,6.5,10,9,9,10,42,0,7,19,21,22,27,31,53,84,39,53,54,51,0.23,34,36,9,7,9,34,80,0,38,31,0,2.2,0,16,3.7,28.3,27,29.2,72,0,0,79,4,0,15.6,54,20,31,19,38,27,15,159.1,0,114];
for k=1:96 %->iteração sobre os monitores/transformadores
    if Kvar_adotado(k)~=0
        %f = strcat('1_Resultados_sem_geracao/Alimentador_Mon_mon_',num2str(k),'_1.csv');
        %f2 = strcat('2_Resultados_sem_geracao_com_capacitores/Alimentador_Mon_mon_',num2str(k),'_1.csv');

        %f = strcat('3_Resultados_com_geracao_0.5/Alimentador_Mon_mon_',num2str(k),'_1.csv');
        %f2 = strcat('4_Resultados_com_geracao_0.5_com_capacitores/Alimentador_Mon_mon_',num2str(k),'_1.csv');
        
        f = strcat('5_Resultados_com_geracao_1.0/Alimentador_Mon_mon_',num2str(k),'_1.csv');
        f2 = strcat('6_Resultados_com_geracao_1.0_com_capacitores/Alimentador_Mon_mon_',num2str(k),'_1.csv');

        MON = csvread(f,1,0);
        MON2 = csvread(f2,1,0);    
        %Cálculo Potências Reativas Capacitivas de Correção
        Q = [];
        Q2 = [];
        FP_nao_corr = [];
        FP_corrigido = [];
        N_STEPS = [];
        
        %f_result = fopen(strcat('RESULTADOS_MATLAB/SEM_GERACAO/',num2str(k),'.txt'),'w');
        %f_result = fopen(strcat('RESULTADOS_MATLAB/GERACAO_0.5/',num2str(k),'.txt'),'w');
        f_result = fopen(strcat('RESULTADOS_MATLAB/GERACAO_1.0/',num2str(k),'.txt'),'w');
        for i=1:96
            %Potências reativas capacitivas TRIFÁSICAS
            FP_nao_corr(i) = MON(i,3)/sqrt(MON(i,3)^2 + MON(i,4)^2);
            Q(i) = 3*(MON(i,4) - (tan(acos(1))*MON(i,3)));
            FP_corrigido(i) = MON2(i,3)/sqrt(MON2(i,3)^2 + MON2(i,4)^2);
            Q2(i) = 3*(MON(i,4)- MON2(i,4));
            N_STEPS(i) = round(Q2(i)/(Kvar_adotado(k)/20));
            %Escrevendo para o arquivo TXT
            fprintf(f_result,'Hora[%d] | FP: %f => %f | Cap_matlab = %f | Cap_utilizado = %f | N_passo=%d \n',i,FP_nao_corr(i),FP_corrigido(i),Q(i),Q2(i),N_STEPS(i));
        end
        fclose(f_result);
    end    
end