# This file provides a configuration for blazegraph:

CONFIG = {
  engine: Wikidata::Virtuoso,
  schemas: [:onaryrel, :ongraphs, :osgprop, :ostdreif],
  masks: (1..31).map { |i| "%05b" % i },
  quins: lambda { |mask| "query_parameters/quins/quins_#{mask}.csv" },
  homes: [1,2],
  max_queries: 300,
  max_solutions: 10000,
  client_timeout: 60,
  server_timeout: 60
}