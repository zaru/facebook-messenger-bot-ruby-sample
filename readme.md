# facebook messenger bot sample

## usage

```
$ bundle install
$ VERIFY_TOKEN=<VERIFY_TOKEN> API_TOKEN=<TOKEN> bundle exec puma --config config/puma.rb -d
```

```
$ VERIFY_TOKEN=<VERIFY_TOKEN> API_TOKEN=<TOKEN> bundle exec pumactl halt
$ VERIFY_TOKEN=<VERIFY_TOKEN> API_TOKEN=<TOKEN> bundle exec pumactl restart
```