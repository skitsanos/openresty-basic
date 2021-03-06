--
-- OS Utils
-- @author Skitsanos, http://github.com/skitsanos
--

local f = {}

-- Executes shell command and captures its output
local function readProcessOutput(cmd)
    local ioUname = io.popen(cmd, 'r')
    local output = ioUname:read('*all')
    ioUname:close()

    return output
end

--- Returns {string} windows|linux|darwin
function f.os()
    local envOS = os.getenv('OS')
    if (envOS == 'Windows_NT') then
        return 'windows'
    end

    return string.lower(readProcessOutput([[uname]]))
end

--- Returns {string} process working directory
function f.pwd()
    local output;

    if (f.os() == 'windows') then
        return readProcessOutput([[cd]])
    else
        return readProcessOutput([[pwd]])
    end
end

return f