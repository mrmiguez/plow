### plow.sh

plow.sh is a metadata reporting tool for digital libraries. It harvests records from the OAI feed of you digital library and runs low-level analytics on them to build a report spreadsheet. The last step of plow.sh archives the records you downloaded as a compressed .tar.gz file

plowReport.sh is only the reporting and archiving aspects of plow.sh. plowReport.sh can be used to re-run reports on data previously 
harvested by plow.sh.

#### Requirements

* bash 

---Plow is a bash script and requires the bourne again shell to run. bash is the default terminal in Linux and Mac OS. Windows users 
can install Cygwin to access bash.

* xmlstarlet

---Xmlstarlet is a command line tool for interacting with XML documents. Both plow.sh and plowReport.sh require xmlstarlet to run 
properly.

* pyoaiharvest.py

---pyoaidharvest.py is a python script written by Mark Phillips that harvests data from OAI-PMH feeds. plow.sh and plowReport.sh must 
be modified to point to the directory containing pyoaiharvest.py. It can be accessed from https://github.com/vphill/pyoaiharvester

* dc_breaker.py

---dc_breaker.py is another python script written by Mark Phillips. It is used by plow.sh and plowReport.sh to analyse the dc_oai data 
harvsted from your oai feed. plow.sh and plowReport.sh must be modified to point to the directory containing dc_breaker.py. It can be 
accessed from https://github.com/vphill/metadata_breakers
