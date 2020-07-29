clear
clc
%% Parâmetros iniciais

N = 3; % população inicial
M = 5; % população máxima
max_same = 10; % quantidade de vezes que o mesmo indíviduo foi selecionado como melhor
max_gen = 10; % quantidade de gerações para parada
Pc = 0.7;
Pm = 0.4;
n_best = 1;
size_I1 = 13;
size_I2 = 13;
size_out = 13;
size_rules = 25;

%% Geração da população inicial
population = initialization(N, size_I1, size_I2, size_rules, size_out);

display("Gerou a população!");

sorted_population = fitness(population, N);

display("Calculou os custos!");

last_best = zeros(1,64);
n_same = 0;

%% Loop por geração

for g = 1 : max_gen
    new_population = [];    
    %% Elitismo
    bests = sorted_population(1,2:65);
    if (last_best == bests)
        n_same = n_same + 1;
    else
        last_best = bests;
        n_same = 0;
    end
    for c=2 : n_best                        % seleciona n_best melhores de cada geração para permanecer na próxima
        bests = [bests sorted_population(c,2:65)];
    end
    new_population = [bests]; 
    
    display("Selecionou os melhores (Elitismo)!");
    
    %% Crossover
        
    for i = 1 : (Pc*N)
        [ind1, ind2] = roulette(sorted_population);
        
        [filho1, filho2] = crossover(sorted_population(ind1,2:65)', sorted_population(ind2,2:65)');
        
        new_population = [new_population; filho1; filho2];
        
    end
    
    display("Fez o Crossover! 18+");
    
    %% Mutação
    new_population = [sorted_population(:, 2:65); new_population];
    display("Podem estar acontecendo mutações!");
    for i = 1 : (size(new_population))
        if (rand() < Pm)
            new_ind = mutation(new_population(i,:));
            new_population = [new_population; new_ind];
        end
    end
    
    %% Teste do "Custo" dos Novos Indivíduos
    
    sorted_population = fitness(new_population', size(new_population,1));
    
    %% Exclusão de Indivíduos menos "evoluídos"
    
    while (size(sorted_population,1) > M)
        sorted_population(end,:) = [];
    end
    
    N = size(sorted_population,1);  
    
    %% Checagem de parada
    
    if (n_same == max_same)
        break;
    end
    
    display("Nova geração vindo aí!");
    
end