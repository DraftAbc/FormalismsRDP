--labelled_edges_HyperMultiGraph
package.path = package.path .. ";/home/Documents/CosyVerif/library/src/?.lua"

local Repository = require "cosy.repository"
local HMG = require "hyper-multi-graph"

repository = Repository.new()
Repository.options (repository).create = function () return {} end
Repository.options (repository).import = function () return {} end

repository.hyper_multi_graph = HMG

local _ = Repository.placeholder(repository)

repository.labelled_edges_hyper_multi_graph = {
	[Repository.depends] = {
		repository.hyper_multi_graph
	},
	
	labelled_edges_hyper_multi_graph_type = {
		[Repository.refines] = {
			_.hyper_multi_graph_type
		},

		label_edge_type = {},
		
		edge_type = {
		  labels = {},
		}
	}
}

return repository.labelled_edges_hyper_multi_graph
