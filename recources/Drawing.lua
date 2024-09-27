local Drawing = {}

local objectConfigs = {
    Square = function()
        local object = Instance.new("Frame")
        object.BackgroundColor3 = Color3.new(1, 1, 1)
        object.BorderSizePixel = 0
        return object
    end,
    Circle = function()
        local object = Instance.new("Frame")
        object.BackgroundColor3 = Color3.new(1, 1, 1)
        object.BorderSizePixel = 0
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = object
        return object
    end,
    Text = function()
        local object = Instance.new("TextLabel")
        object.BackgroundTransparency = 1
        object.BorderSizePixel = 0
        object.TextColor3 = Color3.new(1, 1, 1)
        return object
    end,
    Line = function()
        local object = Instance.new("Frame")
        object.BackgroundColor3 = Color3.new(1, 1, 1)
        object.BorderSizePixel = 0
        return object
    end,
    Triangle = function()
        local object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://1114469371"
        object.BackgroundTransparency = 1
        return object
    end,
    Hexagon = function()
        local object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://2718828198"
        object.BackgroundTransparency = 1
        return object
    end,
    Ellipse = function()
        local object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://4292970420"
        object.BackgroundTransparency = 1
        return object
    end,
    Pentagon = function()
        local object = Instance.new("ImageLabel")
        object.Image = "rbxassetid://4975806418"
        object.BackgroundTransparency = 1
        return object
    end
}

getgenv().Drawing.new = function(objectType)
    return objectConfigs[objectType] and objectConfigs[objectType]() or nil
end

getgenv().Drawing.setPosition = function(object, x, y)
    object.Position = UDim2.new(0, x, 0, y)
end

getgenv().Drawing.setSize = function(object, width, height)
    object.Size = UDim2.new(0, width, 0, height)
end

getgenv().Drawing.setColor = function(object, color)
    if object:IsA("Frame") or object:IsA("ImageLabel") then
        object.BackgroundColor3 = color
    elseif object:IsA("TextLabel") then
        object.TextColor3 = color
    end
end

getgenv().Drawing.setText = function(object, text)
    if object:IsA("TextLabel") then
        object.Text = text
    end
end

getgenv().Drawing.addToParent = function(object, parent)
    object.Parent = parent
end

return Drawing
