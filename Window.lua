-- Window.lua
local WindowLib = {}

-- İnternetten Elements.lua'yı çekiyoruz
local Elements = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoLib/main/Elements.lua"))()

function WindowLib:CreateWindow(options)
    -- ... (Senin CreateWindow kodlarının tamamı buraya gelecek) ...
    -- ... (Sadece en içteki CreateButton vs. kısımlarında Elements tablosunu kullanacak) ...
    
    -- Önemli Not: WindowFunctions içindeki CreateButton fonksiyonunu şu şekilde güncelle:
    -- function WindowFunctions:CreateButton(text, callback)
    --    Elements:CreateButton(Page, text, callback)
    -- end

    return WindowFunctions
end

return WindowLib
