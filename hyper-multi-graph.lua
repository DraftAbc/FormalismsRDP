--hyperMultiGraph
package.path = package.path .. ";/home/Documents/CosyVerif/library/src/?.lua"

local Repository = require "cosy.repository"
local repository = Repository.new()

Repository.options (repository).create = function () return {} end
Repository.options (repository).import = function () return {} end

local _ = Repository.placeholder(repository)

repository.hyper_multi_graph = {
	hyper_multi_graph_type = {
		transition_type = {},
		place_type = {},

		edge_type = {
			arrow_type = {
				value_type = place_type,
                                value_type = transition_type,
			}, 
			arrows = {
			  ["cosy:meta"] = {
		      content_type = _.arrow_type,
		      checks = {},
  	    }
			} --extends typed_collection with type arrow_type
		},
		
		places = {
		  ["cosy:meta"] = {
		    content_type = _.place_type,
		    checks = {},
		  },
                transitions = {
		  ["cosy:meta"] = {
		    content_type = _.transition_type,
		    checks = {},
		  },

		}, 
		edges = {
		  ["cosy:meta"] = {
		    content_type = _.edge_type,
		    checks = {},
		  },
		} --extends typed_collection with type edge_type
	}
}
return repository.hyper_multi_graph
