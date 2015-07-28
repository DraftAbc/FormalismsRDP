--tests

package.path = package.path .. ";/home/Documents/CosyVerif/library/src/?.lua"

local Repository = require "cosy.repository"
local graph = require "graph"

repository = Repository.new()
Repository.options (repository).create = function () return {} end
Repository.options (repository).import = function () return {} end
	
repository.graph = graph	

local _ = Repository.placeholder(repository)

repository.graph_inst = {	
	[Repository.depends] = {
		repository.graph,
	},
	
	[Repository.refines] = {
	  _.graph_type,
	},
	
	places = {
	        P1 = {
		  [Repository.refines] = {
		    _.hyper_multi_graph_type.place_type
		  },
		  _ = "P1",
		},
		
		P2 = {
		  [Repository.refines] = {
		    _.hyper_multi_graph_type.place_type
		  },
		  _ = "P2",
		},
		
		P3 = {
		  [Repository.refines] = {
		    _.hyper_multi_graph_type.place_type
		  },
		  _ = "P3",
		},
                P4 = {
		  [Repository.refines] = {
		    _.hyper_multi_graph_type.place_type
		  },
		  _ = "P4",
		},
  },

  transitions = {
	        t1 = {
		  [Repository.refines] = {
		    _.hyper_multi_graph_type.transition_type
		  },
		  _ = "t1",
		},
		
		t2 = {
		  [Repository.refines] = {
		    _.hyper_multi_graph_type.transition_type
		  },
		  _ = "t2",
		},
		
	
  },
	
  
}

do
  local G = repository.graph_inst
  local P = G.places
  local T = G.transitions

  for k,p in Repository.iterate(P) do
    print(k, P[k]._)
  end
   for k,t in Repository.iterate(P) do
    print(k, T[k]._)
  end
end

return repository.graph_inst
	
	
	
	
	
	
	
	
