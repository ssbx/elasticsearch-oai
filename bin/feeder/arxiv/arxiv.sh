#!/bin/sh

java="/usr/bin/java"
#java="/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home/bin/java"
#java="/usr/java/jdk1.8.0/bin/java"

echo '
{
    "url" : "http://export.arxiv.org/oai2?verb=ListRecords&metadataPrefix=arXiv&from=2000-01-01&until=2015-01-01",
    "concurrency" : 1,
    "handler" : "xml",
    "elasticsearch" : "es://localhost:9300?es.cluster.name=elasticsearch",
    "index" : "arxiv",
    "type" : "arxiv",
    "maxbulkactions" : 1000,
    "maxconcurrentbulkrequests" : 1,
    "client" : "bulk",
    "trace" : false,
    "scrubxml" : false
}
' | ${java} \
    -cp $(pwd):$(pwd)/\*:$(pwd)/../../lib/\* \
    org.xbib.elasticsearch.plugin.feeder.Runner \
    org.xbib.elasticsearch.plugin.feeder.oai.OAIFeeder
