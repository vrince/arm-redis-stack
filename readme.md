# arm-redis

[![redis](https://github.com/vrince/arm-redis/actions/workflows/redis.yml/badge.svg)](https://github.com/vrince/arm-redis/actions/workflows/redis.yml)

Automated builds of [redis](https://github.com/redis/redis) for arm 32bits (armv7). Primary target is raspberry-pi using 32 bits OS.

See this repo for [RedisTimeSeries](https://github.com/vrince/arm-redis-timeseries)

## Install

### Redis

Look into the "release" section of github, here is an example with `7.0.0` :

```bash
wget https://github.com/vrince/arm-redis/releases/download/redis%2F7.0.0/redis-linux-armv7-7.0.0.tar.gz
tar -xf redis-linux-armv7-7.0.0.tar.gz 
./bin/redis-server
```

You should see something like:

```bash
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 7.0.0 (d375595d/0) 32 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                  
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 17085
  `-._    `-._  `-./  _.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |           https://redis.io       
  `-._    `-._`-.__.-'_.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |                                  
  `-._    `-._`-.__.-'_.-'    _.-'                                   
      `-._    `-.__.-'    _.-'                                       
          `-._        _.-'                                           
              `-.__.-'              
```

The content of `./bin` folder can be moved in a more generic place like `/usr/local/bin` to be able to use all redis command (`redis-server`, `redis-cli`, ...) from anywhere.
