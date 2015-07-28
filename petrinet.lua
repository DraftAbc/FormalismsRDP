--petrinet
package.path = package.path .. ";/home/Documents/CosyVerif/library/src/?.lua"

local Repository = require "cosy.repository"
local LEHMG = require "labelled-edges-hyper-multi-graph"
local LPHMG = require "labelled-place-hyper-multi-graph"
local LTHMG = require "labelled-transition-hyper-multi-graph"
local MG = require "multi-graph"
local DHMG = require "directed-hyper-multi-graph"
local V = require "valuation"


repository = Repository.new()
Repository.options (repository).create = function () return {} end
Repository.options (repository).import = function () return {} end

repository.multi_graph = MG
repository.directed_hyper_multi_graph = DHMG
repository.labelled_edges_hyper_multi_graph = LEHMG
repository.labelled_place_hyper_multi_graph = LPHMG
repository.labelled_transition_hyper_multi_graph = LTHMG
repository.valuation = V

local _ = Repository.placeholder(repository)

repository.petrinet = {
	[Repository.depends] = {
		repository.directed_hyper_multi_graph,
		repository.labelled_edges_hyper_multi_graph,
		repository.labelled_place_hyper_multi_graph,
		repository.labelled_transition_hyper_multi_graph,
		repository.multi_graph,
		repository.valuation,
	},
	
	petrinet_type = {
		[Repository.refines] = {
			_.multi_graph_type,
			_.directed_hyper_multi_graph_type,
			_.labelled_edges_hyper_multi_graph_type,
			_.labelled_place_hyper_multi_graph_type,
			_.labelled_transition_hyper_multi_graph_type,
			_.valuation_type,
		},
		
		label_edge_type = {
		  symbol = symbol_type,
		},

		initial_place_type = {
		  value_type = place_type,
		},
		
		accept_place_type = {
		  value_type = place_type,
		},
		
		initials_places = {},
		
		accept_places = {},


		initial_transition_type = {
		  value_type = transition_type,
		},
		
		accept_transition_type = {
		  value_type = transition_type,
		},
		
		initials_transitions = {},
		
		accept_transitions = {},
	}
	
	
}

return repository.petrinet
				
