prompt = 'What is the original value? ';
result = input(prompt)
X = result*10
prompt = 'Do you want more? Y/N [Y]: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end