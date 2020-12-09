# ITS DataHub Search

This repository contains the [ElasticSearch](https://www.elastic.co/products/elasticsearch) index definition for the **datasets**.

The definition for the index *dataassets* is contained in the file file **index-dataassets-sts.json**.

Sample data is provided under the *data* folder in file **datahub-dataassets-all-sample.txt**

Bash shell scripts are provided to *create* the index and *load* the sample data into the created index.

## Usage
Because the provided scripts are executed using [bash shell](https://www.gnu.org/software/bash/) and [curl](https://curl.haxx.se/) the following steps considers that the tools are already installed.

### Create Index

> Command Format
> 
> create-indexes.sh INDEX HOST
> - INDEX : Name of the Index to be created
> - HOST : Host address including port and protocol (http/https)

### Load Sample Data

> Command Format
>
> load_sample_data.sh INDEX HOST DATAFILE
> - INDEX: Name of the Index where the data will be loaded.
> - HOST: Host address including port and protocol (http/https)
> - DATAFILE: File in text format that includes the data to **bulk insert** into the **Index**.
>   - See [Elasticsearch Bulk API](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-bulk.html) for the file's format content.


## Configuration

The required version of Elasticsearch is  [7.x](https://www.elastic.co/downloads/elasticsearch).

## Installation
For installation of Elasticsearch refer to [Installing Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html) instruction.

[Amazon Web Services (AWS)](https://aws.amazon.com/) offers Amazon Elasticsearch Service and could be a good alternative to host an Elasticsearch instance, see the instructions for the [developer guide](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide)

## File Manifest
* create-indexes.sh : Creates an Index in an Elasticsearch instance.
* schemas/dataassets-index.json : Elasticsearch index definition for the **data assets** index; holds metadata information on data assets.
* schemas/configurations-index.json : Elasticsearch index definition for the **configurations** index; holds configuration information on ITS DataHub.
* schemas/related-index.json : Elasticsearch index definition for the **related** index; holds linkage information on related source code assets from ITS CodeHub.
* schemas/metrics-index.json : Elasticsearch index definition for the **metrics** index; holds usage metrics on ITS DataHub assets.
* data/load_sample_data.sh : Loads data into an existing index in Elasticsearch.
* data/datahub-dataassets-all-sample.txt : Contains sample data to be loaded into a data assets Index.
* data/datahub-related-sample.txt : Contains sample data to be loaded into a related Index.
* data/configurations-document.json : Contains sample data to be loaded into a configurations Index.
* data/datahub-metrics-sample.txt : Contains sample data to be loaded into a metrics Index.



## Development setup
> Requires to have Elasticsearch instance running and available.
1. Open a command line window
```shell
./create-indexes.sh dataassets [http://elasticsearch-url:port]
```
2. Validate whether the index was created by listing the indexes in the Elasticsearch.
```shell
curl -X GET [http://elasticsearch-url:port]/_cat/indices?v
```
  * The **dataassets** should be listed in the reponse of the previous command.

3. Load sample data
```shell
 ./data/load_sample_data.sh dataassets [http://elasticsearch-url:port] ./data/datahub-dataassets-all-sample.txt
```

4. Validate if data was loaded
```shell
  curl -X GET [http://elasticsearch-url:port]/dataassets/_search
```

## Release History
* 0.1.0
  * Initial version


## Contact information
ITS CodeHub Support Team : data.itsjpo@dot.gov

Distributed under XYZ license. See *LICENSE* for more information

## Contributing
1. Fork it (https://github.com/usdot-its-jpo-data-portal/datahub-search/fork)
2. Create your feature branch (git checkout -b feature/fooBar)
3. Commit your changes (git commit -am 'Add some fooBar')
4. Push to the branch (git push origin feature/fooBar)
5. Create a new Pull Request

## Known Bugs
*

## Credits and Acknowledgment
Thank you to the Department of Transportation for funding to develop this project.

## CODE.GOV Registration Info
* __Agency:__ DOT
* __Short Description:__ Defines and creates Elasticsearch indexes for ITS DataHub.
* __Status:__ Beta
* __Tags:__ transportation, connected vehicles, intelligent transportation systems, python, DMP, Sufficiency Checklist, Elasticsearch
* __Labor Hours:__
* __Contact Name:__
* __Contact Phone:__
