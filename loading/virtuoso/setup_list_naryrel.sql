-- Deleting previous entries of loader script
delete from DB.DBA.load_list;
--      <folder with data>  <pattern>    <default graph if no graph file specified>
ld_dir ('/usr/local/virtuoso-opensource/var/lib/virtuoso/db-naryrel-1/wikidata', '*-naryrel.nq.gz', 'http://wikidata.org');
checkpoint;
commit WORK;
checkpoint;
EXIT;
