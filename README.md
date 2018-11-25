# Elasticsearch examples for Japanese postal code data

## tools

We use Elastic stack products of version 6.5.1. First of all, you need to download the archives for the following tools from [Downloads page at Elastic](https://www.elastic.co/jp/downloads).

- Elasticsearch
- Kibana
- Logstash
- Filebeat

To follow the instructions in this page, extract all the files in the "tools" directory.

## data

Postal code data can be retrieved from [the download page](https://www.post.japanpost.jp/zipcode/download.html). We use "kogaki" data, in which sokuon and hatsuon are written in small letters.

The data are distributed in two format: (i) separated files by prefectures and (ii) a file for all prefectures. For simplicity, we use the "all in one" format in this page.

The "all in one" file can be downloaded at "全国一括" in [kogaki data](https://www.post.japanpost.jp/zipcode/dl/kogaki-zip.html).

## configuration files

### Logstash

You can find a configuration file for logstash to parse a postal code CSV file as conf/logstash_postal_csv.conf.

### Filebeat

You can find a configuration file for filebeat in conf/filebeat.yaml. With this file, you can split each line of the input file and send it to logstash at localhost:5044.

## start Elastic stack processes

### Elasticsearch

```
$ tools/elasticsearch-6.5.1/bin/elasticsearch
```

### Kibana

```
$ tools/kibana-6.5.1/bin/kibana
```

### Logstash

```
$ tools/logstash-6.5.1/bin/logstash -f first-pipeline.conf --config.test_and_exit
$ tools/logstash-6.5.1/bin/logstash -f first-pipeline.conf --config.reload.automatic
```

### Filebeat

```
$ tools/filebeat-6.5.1-linux-x86_64/filebeat -e -c conf/filebeat.yaml -d "publish"
```
