local ioPWD;

local envOS = os.getenv('OS')
if (envOS == 'Windows_NT') then
    ioPWD = io.popen('cd', 'r')
else
    ioPWD = io.popen('pwd', 'r')
end

local output = ioPWD:read('*all')
ioPWD:close()
return output