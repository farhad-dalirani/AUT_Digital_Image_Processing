% input bit stream
bit_stream = '111111000011110000000011100000111111111111111111101111111110101110111100';

% run-length code
rl_code = [];

% count number of consecutive '1' or '0'
count = 0;
for i=1:size(bit_stream, 2)
    
    if i == 1
        count = count + 1;
    else
        if bit_stream(1,i) == bit_stream(1,i-1)
            count = count + 1;
        else
            if count < 15
                rl_code = [rl_code de2bi(count, 4, 'left-msb')];
            else
                rl_code = [rl_code de2bi(15, 4, 'left-msb')];
                rl_code = [rl_code de2bi(count-15, 4, 'left-msb')];
            end
            
            count = 1;
        end
    end
    
end
rl_code = [rl_code de2bi(count, 4, 'left-msb')];

disp('Run Length Code');
disp(rl_code);

disp('Run Length Code');
disp(mat2str(rl_code));