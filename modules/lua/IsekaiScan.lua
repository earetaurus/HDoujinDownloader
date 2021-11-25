-- A Madara variant similar to Madara (Ajax), except the API endpoint is different ("/ajax/chapters/").

require "Madara"

function Register()

    module.Name = 'IsekaiScan'
    module.Language = 'English'

    module.Domains.Add('isekaiscan.com')
    module.Domains.Add('manhwahentai.me', 'ManhwaHentai.me')

end

function GetChapters()

    local chapterListNodeCount = dom.SelectElements('//div[@id="manga-chapters-holder"]').Count()

    if(chapterListNodeCount > 0) then

        local endpoint = url:trim('/') .. '/ajax/chapters/' 

        http.Headers['x-requested-with'] = 'XMLHttpRequest'

        dom = Dom.New(http.Post(endpoint, ' '))

        chapters.AddRange(dom.SelectElements('//li[contains(@class,"wp-manga-chapter")]/a'))
    
        chapters.Reverse()

    end

end