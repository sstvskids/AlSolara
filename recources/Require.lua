local modules = {}

getgenv().loadModule = function(modulePath)
    local module = script:FindFirstChild(modulePath)
    if module and module:IsA("ModuleScript") then
        local moduleFunction, err = loadstring(module.Source)
        if not moduleFunction then
            error("Failed to compile module script: " .. (err or "Unknown error"))
        end
        local success, result = pcall(moduleFunction)
        if success then
            return result
        else
            error("Failed to execute module function: " .. result)
        end
    else
        error("Module not found or invalid: " .. modulePath)
    end
end

getgenv().require = function(modulePath)
    if not modules[modulePath] then
        modules[modulePath] = loadModule(modulePath)
    end
    return modules[modulePath]
end

return require
