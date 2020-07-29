function [ new_ind ] = mutation(individual)
    a = randi(13);
    b = randi(13)+13;
    c = randi(25)+26;
    d = randi(13)+51;
    
    individual(a) = 30*(rand()- 0.5);
    individual(b) = rand()- 0.5;
    individual(c) = randi(5);  
    individual(d) = 5 * rand() - 1;
    
    I1 = sort(individual(1:13));
    I2 = sort(individual(14:26));
    OUT = sort(individual(52:64));
    
    new_ind = [I1 I2 individual(27:51) OUT];
end