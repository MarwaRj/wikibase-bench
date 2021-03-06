# This file provides a configuration for blazegraph:

CONFIG = {
  engine: Wikidata::Virtuoso,
  dbfiles: 'sdw',
  dbhome: 'virtuoso',
  #schemas: [:data, :cpprop, :ngraphs, :sgprop, :naryrel, :stdreif],
  schemas: [:sgprop, :naryrel, :stdreif],
  templates: ['DBM-HAR-01','DBQ-HAR-01','DBM-SIM-02','DBQ-SIM-02'],
  folder: '/home/benchmark/data2/wikidata/wikibase-bench/queries/sdw/',
  homes: [1],
  queries: (0...40).to_a,
  max_solutions: 10000,
  client_timeout: 400,
  server_timeout: 240
}
