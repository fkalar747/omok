

--^ forin -r .
--> require("{{ erb -rei $.+_get\.lua$ -sep |.| -xf }}")
require("wgea.rhasa._get")
require("debug._get")
--$

--^ forin -r .
--> require("{{ eri+1 -rei $.+_get\.lua$ }}")
require("debug/_get.lua")
--$

--^ forin -r .
--> require("{{ eri  }}")
require("wgea")
require("views")
require("views")
require("debug")
require("main.lua")
--$


--^ forin -r .
--> require("{{ eri+1  }}")
require("wgea/rhasa")
require("views/_init.lua")
require("views/icons")
require("debug/_get.lua")
--$

