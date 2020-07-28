function [ sorted_population ] = fitness(population, N)
    costs = zeros(N,51);
    for i = 1 : N
        fis = mamfis("NumInputs",2,"NumOutputs",1, "NumInputMFs",1, "NumOutputMFs",1);
        fis.Inputs(1).Name = "erro";
        fis.Inputs(1).Range = [-15 15];
        fis.Inputs(2).Name = "der_erro";
        fis.Inputs(2).Range = [-5 5];
        fis.Outputs(1).Name = "saida";
        fis.Outputs(1).Range = [-0.25 0.25];
        fis = addMF(fis,"erro","trimf",[-45 population(1,i) population(3,i)]);
        fis = addMF(fis,"erro","trimf",[population(2,i) population(4,i) population(6,i)]);
        fis = addMF(fis,"erro","trimf",[population(5,i) population(7,i) population(9,i)]);
        fis = addMF(fis,"erro","trimf",[population(8,i) population(10,i) population(12,i)]);
        fis = addMF(fis,"erro","trimf",[population(11,i) population(13,i) 45]);
        fis = removeMF(fis,"erro","mf1");

        fis = addMF(fis,"der_erro","trimf",[-5 population(14,i) population(16,i)]);
        fis = addMF(fis,"der_erro","trimf",[population(15,i) population(17,i) population(19,i)]);
        fis = addMF(fis,"der_erro","trimf",[population(18,i) population(20,i) population(22,i)]);
        fis = addMF(fis,"der_erro","trimf",[population(21,i) population(23,i) population(25,i)]);
        fis = addMF(fis,"der_erro","trimf",[population(24,i) population(26,i) 5]);
        fis = removeMF(fis,"der_erro","mf1");
        
        fis = addMF(fis,"saida","trimf",[-10 population(52,i) population(54,i)],'VariableType',"output");
        fis = addMF(fis,"saida","trimf",[population(53,i) population(55,i) population(57,i)],'VariableType',"output");
        fis = addMF(fis,"saida","trimf",[population(56,i) population(58,i) population(60,i)],'VariableType',"output");
        fis = addMF(fis,"saida","trimf",[population(59,i) population(61,i) population(63,i)],'VariableType',"output");
        fis = addMF(fis,"saida","trimf",[population(62,i) population(64,i) 10],'VariableType',"output");
        fis = removeMF(fis,"saida","mf1",'VariableType',"output");
        
        %figure(1)
        %plotmf(fis,"input",1)
        %figure(2)
        %plotmf(fis,"input",2)
        
        fis.Rules = [];
        
        rule1 = [1 1 population(27,i) 1 1];
        rule2 = [2 1 population(28,i) 1 1];
        rule3 = [3 1 population(29,i) 1 1];
        rule4 = [4 1 population(30,i) 1 1];
        rule5 = [5 1 population(31,i) 1 1];
        rule6 = [1 2 population(32,i) 1 1];
        rule7 = [2 2 population(33,i) 1 1];
        rule8 = [3 2 population(34,i) 1 1];
        rule9 = [4 2 population(35,i) 1 1];
        rule10 = [5 2 population(36,i) 1 1];
        rule11 = [1 3 population(37,i) 1 1];
        rule12 = [2 3 population(38,i) 1 1];
        rule13 = [3 3 population(39,i) 1 1];
        rule14 = [4 3 population(40,i) 1 1];
        rule15 = [5 3 population(41,i) 1 1];
        rule16 = [1 4 population(42,i) 1 1];
        rule17 = [2 4 population(43,i) 1 1];
        rule18 = [3 4 population(44,i) 1 1];
        rule19 = [4 4 population(45,i) 1 1];
        rule20 = [5 4 population(46,i) 1 1];
        rule21 = [1 5 population(47,i) 1 1];
        rule22 = [2 5 population(48,i) 1 1];
        rule23 = [3 5 population(49,i) 1 1];
        rule24 = [4 5 population(50,i) 1 1];
        rule25 = [5 5 population(51,i) 1 1];
        
        
        rules = [rule1; rule2; rule3; rule4; rule5; rule6; rule7; rule8; rule9; rule10; rule11; rule12; rule13; rule14; rule15;
            rule16; rule17; rule18; rule19; rule20; rule21; rule22; rule23; rule24; rule25];
        
        fis = addRule(fis,rules);
        
        writeFIS(fis, 'fis');
        
        simOut = sim('ModeloTanques', 'timeout', 200);
        niveis = simOut.get('Niveis');
        sinais = simOut.get('ControlSignal');
        
        e1 = sum(sinais(:,2))/size(sinais(:,2),1);
        e2 = sum((sinais(:,2)- e1).^2)/size(sinais(:,2),1);
        e3 = sum((niveis(:,2)-niveis(:,4)).^2)/size(niveis,1);
        
        cost = 0.2*e1 + 0.25*e2 + 0.55*e3;
        
        costs(i,:) = [cost population(:,i)'];
        
        sorted_population = sortrows(costs);
        
    end
end
