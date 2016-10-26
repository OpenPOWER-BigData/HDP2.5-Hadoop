#mvn versions:set -DnewVersion=2.7.1-ppc64le
mvn clean install -DskipTests -Dtar -Drequire.snappy -Pdist,native
