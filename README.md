```
$ docker-compose -f hasura.yml up -d
```

Or the choose the image with timescale postgres plugin.
This approach can work for the arbitrage subscribded table it the update of state it is to frequent.
Example bellow with bot_v1 table is not practical!.

```
$ docker-compose -f timescale.yml up -d
```

Restore the table bot_v1
```
$ docker exec -i <container-name> psql -U postgres postgres < bot_v1.sql
```


If you choose the timescale approach:
```
$ docker exec -it <container-name> bash
$ psql -U postgres
>  SELECT create_hypertable('bot_v1', 'tz');
> CREATE VIEW last_20_sec_arb AS (
  SELECT time_bucket('20 seconds', tz) AS twenty_sec_interval,
  id,
  name,
  status
  FROM bot_v1
  WHERE tz > NOW() - interval '20 seconds'    
  GROUP BY twenty_sec_interval
  ORDER BY twenty_sec_interval ASC
);
```

Then you can create the subscription:
```
gql`subscription {
  last_20_sec_arb(
    order_by: {
      twenty_sec_interval: asc
    }
  ) {
    twenty_sec_interval
    id
    name
    status
  }
}
`
```

Dump table bot_v1
docker exec -i <container-name> pg_dump -U postgres --column-insert --table=bot_v1 > bot_v1.sql