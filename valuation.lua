--valuation
package.path = package.path .. ";/home/Documents/CosyVerif/library/src/?.lua"

local Repository = require "cosy.repository"
local repository = Repository.new()

Repository.options (repository).create = function () return {} end
Repository.options (repository).import = function () return {} end

repository.valuation = {
    valuation_type = {
    symbol_type = {},
    symbols = {},
  },
}
    
return repository.valuation
