# arm-redis

[![redis](https://github.com/vrince/arm-redis/actions/workflows/redis.yml/badge.svg)](https://github.com/vrince/arm-redis/actions/workflows/redis.yml)

Automated builds of [redis](https://github.com/redis/redis) for arm 32bits (armv7). Primary target is raspberry-pi using 32 bits OS.

See this repo for [RedisTimeSeries](https://github.com/vrince/arm-redis-timeseries)

## Install

### Redis

Look into the "release" section of github, here is an example with `7.0.0` :

```bash
wget https://github.com/vrince/arm-redis/releases/download/7.2.7/redis-linux-armv7-bookworm-7.2.7.tar.gz
tar -xf redis-linux-armv7-bookworm-7.2.7.tar.gz
./bin/redis-server

5541:C 31 Jan 2025 20:53:46.649 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
15541:C 31 Jan 2025 20:53:46.649 * Redis version=7.2.7, bits=32, commit=ba181057, modified=0, pid=15541, just started
15541:C 31 Jan 2025 20:53:46.649 # Warning: no config file specified, using the default config. In order to specify a config file use ./bin/redis-server /path/to/redis.conf
15541:M 31 Jan 2025 20:53:46.652 * Increased maximum number of open files to 10032 (it was originally set to 1024).
15541:M 31 Jan 2025 20:53:46.652 * monotonic clock: POSIX clock_gettime
15541:M 31 Jan 2025 20:53:46.653 # Warning: 32 bit instance detected but no memory limit set. Setting 3 GB maxmemory limit with 'noeviction' policy now.
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 7.2.7 (ba181057/0) 32 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                  
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 15541
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

15541:M 31 Jan 2025 20:53:46.656 * Server initialized
```

The content of `./bin` folder can be moved in a more generic place like `/usr/local/bin` to be able to use all redis command (`redis-server`, `redis-cli`, ...) from anywhere.
