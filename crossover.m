function [ filho1, filho2 ] = crossover(mae, pai)
    
    limits = sortrows(unique(fix(9*rand(4,1)+2)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : (13))]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : (13))]);

    elseif size_cut(1) == 2
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:13)]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:13)]);

    elseif size_cut(1) == 3
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:13)]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:13)]);

    else
        filho1_1 = sortrows([mae(1:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:13)]);
        filho2_1 = sortrows([pai(1:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:13)]);

    end

    limits = sortrows(unique(fix(3*rand(4,1)+2+13)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : (26))]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : (26))]);

    elseif size_cut(1) == 2
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:26)]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:26)]);

    elseif size_cut(1) == 3
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:26)]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:26)]);

    else
        filho1_2 = sortrows([mae(14:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:26)]);
        filho2_2 = sortrows([pai(14:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:26)]);

    end

    limits = sortrows(unique(fix(26*rand(4,1)+2+26)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1_3 = [mae(21:limits(1)); pai(limits(1)+1 : (51))];
        filho2_3 = [pai(21:limits(1)); mae(limits(1)+1 : (51))];

    elseif size_cut(1) == 2
        filho1_3 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:51)]);
        filho2_3 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:51)]);

    elseif size_cut(1) == 3
        filho1_3 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:51)]);
        filho2_3 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:51)]);

    else
        filho1_3 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:51)]);
        filho2_3 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:51)]);

    end
    
    limits = sortrows(unique(fix(26*rand(4,1)+2+51)));
    size_cut = size(limits);
    if size_cut(1) == 1
        filho1_4 = [mae(21:limits(1)); pai(limits(1)+1 : (64))];
        filho2_4 = [pai(21:limits(1)); mae(limits(1)+1 : (64))];

    elseif size_cut(1) == 2
        filho1_4 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:64)]);
        filho2_4 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:64)]);

    elseif size_cut(1) == 3
        filho1_4 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:64)]);
        filho2_4 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:64)]);

    else
        filho1_4 = sortrows([mae(21:limits(1)); pai(limits(1)+1 : limits(2)); mae(limits(2)+1:limits(3)); pai(limits(3)+1:limits(4)); mae(limits(4)+1:64)]);
        filho2_4 = sortrows([pai(21:limits(1)); mae(limits(1)+1 : limits(2)); pai(limits(2)+1:limits(3)); mae(limits(3)+1:limits(4)); pai(limits(4)+1:64)]);

    end 
    
    filho1 = [filho1_1; filho1_2; filho1_3; filho1_4]';
    filho2 = [filho2_1; filho2_2; filho2_3; filho2_4]';
    
end