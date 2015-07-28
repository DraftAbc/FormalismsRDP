--test_hyper_multi_graph

package.path = package.path .. ";/home/Documents/CosyVerif/library/src/?.lua"

local Repository = require "cosy.repository"
local graph = require "graph"

repository = Repository.new()
Repository.options (repository).create = function () return {} end
Repository.options (repository).import = function () return {} end
	
repository.graph = graph	

local _ = Repository.placeholder(repository)

repository.hyper_multi_graph_inst = {	

  [Repository.depends] = {
		repository.hyper_multi_graph,
	},
	
	[Repository.refines] = {
	  _.hyper_multi_graph_type,
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
  
  edges = {
    e1 = {
      [Repository.refines] = {
		    _.hyper_multi_graph_type.edge_type
		  },
		  arrows = {
		    [Repository.refines] = {
		      _.hyper_multi_graph_type.edge_type.arrow_type
		    },
		    [1] = "P1",
		    [2] = "t1",
		  },
    },
    
    e2 = {
      [Repository.refines] = {
		    _.hyper_multi_graph_type.edge_type
		  },
		  arrows = {
		    [Repository.refines] = {
		      _.hyper_multi_graph_type.edge_type.arrow_type
		    },
		    [1] = "t1",
		    [2] = "P2",
		  },
    },

     e3 = {
      [Repository.refines] = {
		    _.hyper_multi_graph_type.edge_type
		  },
		  arrows = {
		    [Repository.refines] = {
		      _.hyper_multi_graph_type.edge_type.arrow_type
		    },
		    [1] = "P2",
		    [2] = "t2",
		  },
    },

     e4 = {
      [Repository.refines] = {
		    _.hyper_multi_graph_type.edge_type
		  },
		  arrows = {
		    [Repository.refines] = {
		      _.hyper_multi_graph_type.edge_type.arrow_type
		    },
		    [1] = "t2",
		    [2] = "P3",
		  },
    },

    e5 = {
      [Repository.refines] = {
		    _.hyper_multi_graph_type.edge_type
		  },
		  arrows = {
		    [Repository.refines] = {
		      _.hyper_multi_graph_type.edge_type.arrow_type
		    },
		    [1] = "t2",
		    [2] = "P4",
      },
    }
    
  },



}



do
  local G = repository.hyper_multi_graph_inst
  local P = G.places
  local T = G.transitions

  for k,p,t in Repository.iterate(G) do
    print(k, G[k])
    for k2,p2,t2 in Repository.iterate(G[k]) do
      print(k2, G[k][k2]._)
    end
  end
end

return repository.graph_inst

