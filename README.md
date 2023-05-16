```
$ docker-compose -f hasura.yml up -d
```

Restore the tables
```
$ docker exec -i localhasura-postgres-1 psql -U postgres postgres < bot_v1.sql
$ docker exec -i localhasura-postgres-1 psql -U postgres postgres < bot_balances.sql
$ docker exec -i localhasura-postgres-1 psql -U postgres postgres < runs.sql
```

Visit http://localhost:8080/console/data/manage and click [Connect database]
Choose [Postgres] and click [Connect Existing Database]
At [Database name] enter "default"
Choose Emvironment variable and enter "PG_DATABASE_URL"
Click [Connect Database]

Choose default > public and [Under untracked tables and views] click [Track All] to expose all schemas over the GraphQL API


Particular case:
================
You can choose the image with timescale postgres plugin. This approach can work for the arbitrage subscribded table it the update of state it is to frequent.
```
$ docker-compose -f timescale.yml up -d

$ docker exec -it <container-name> bash
$ psql -U postgres
> SELECT create_hypertable('bot_balances', 'tz');
> CREATE VIEW last_20_sec_balance AS (
  SELECT time_bucket('20 seconds', tz) AS twenty_sec_interval,
  id,
  bot_id,
  chain_id,
  balances
  FROM bot_balances
  WHERE tz > NOW() - interval '20 seconds'    
  GROUP BY twenty_sec_interval
  ORDER BY twenty_sec_interval ASC
);
```

Then you can create the subscription:
```
gql`subscription {
  last_20_sec_balance(
    order_by: {
      twenty_sec_interval: asc
    }
  ) {
    twenty_sec_interval
    id,
    bot_id,
    chain_id,
    balances
  }
}
`
```