# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version

2.4.1

## System dependencies

MySQL
Azure Key Vault

## Configuration

Create Service Principal 

```
$ az ad sp create-for-rbac -n "http://my-key-vault" --role contributor
```

Copy .env.sample to .env

```
$ cp .env.sample .env
```

Enter configuration information in .env

```
#
# Azure Key Vault
#
AZURE_TENANT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
AZURE_CLIENT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
AZURE_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
AZURE_SUBSCRIPTION_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```

Create Azure Key Vault(secret)

* MYSQLHOST
* MYSQLUSER
* MYSQLPASS
* MYSQLPORT
* MYSQLDB
* MYSQLCA

## Database creation

```
$ bin/rake db:create
```

## Database initialization

```
$ bin/rake db:migrate
```

## How to run the test suite

```
$ bin/bundle exec rspec
```
