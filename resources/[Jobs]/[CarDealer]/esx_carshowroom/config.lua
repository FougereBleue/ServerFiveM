Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 255, g = 0, b = 0, }
--language currently available EN and SV
Config.Locale = 'fr'
--this is how much the price shows from the purchase price
-- exapmle the cardealer boughts it for 2000 if 2 then it says 4000
Config.Price = 1.5 -- this is times how much it should show

Config.Zones = {

  ShopInside = {
    Pos     = { x = 228.26 , y = -986.57, z = -99.96 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 177.28,
    Type    = 27,
  },

  ShopOutside = {
    Pos     = { x = -1689.66 , y = -2840.09, z = 13.0 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 238.74,
    Type    = 27,
  },

  Katalog = {
    Pos     = { x = 228.12 , y = -991.59, z = -98.50 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 177.28,
    Type    = 22,
  },

  GoDownFrom = {
    Pos   = { x = -50.03, y = -1089.18, z = 26.48 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 22,
  },

  GoUpFrom = {
    Pos   = { x = 240.98, y = -1004.85, z = -98.98 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 22,
  },

}