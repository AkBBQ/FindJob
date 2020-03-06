package com.example.demo.service.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Service;

/**
 * Redis服务类
 * @author xxx
 */
@Service
public class RedisService {
    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;


    /**
     * 获取缓存
     */
    public Object get(String key) {
        return redisTemplate.boundValueOps(key).get();
    }


    /**
     * 删除缓存
     */
    public void delete(String key) {
        stringRedisTemplate.delete(key);
    }

    /**
     * 添加缓存有过期时间
     * @param key
     * @param value
     * @param expire 到期时间
     * @return
     */
    public Boolean setNX(final String key, final String value, final int expire) {
        Boolean result = (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection redisConnection) throws DataAccessException {
                RedisSerializer<String> serializer = redisTemplate.getStringSerializer();
                byte[] keys = serializer.serialize(key);
                byte[] values = serializer.serialize(value);
                Boolean result = redisConnection.setNX(keys, values);
                if (result && expire > 0) {
                    redisConnection.expire(keys, expire);
                }
                return result;
            }
        });
        return result;
    }

    /**
     * 添加缓存
     * @param key
     * @param value
     * @return
     */
    public Boolean add(final String key, final String value) {
        Boolean result = (Boolean) redisTemplate.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection redisConnection) throws DataAccessException {
                RedisSerializer<String> serializer = redisTemplate.getStringSerializer();
                byte[] keys = serializer.serialize(key);
                byte[] values = serializer.serialize(value);
                Boolean result = redisConnection.setNX(keys, values);
                return result;
            }
        });
        return result;
    }


    public Long incr(final String key, final int expire) {
        Long result = (Long) redisTemplate.execute(new RedisCallback<Long>() {
            @Override
            public Long doInRedis(RedisConnection redisConnection) throws DataAccessException {
                RedisSerializer<String> serializer = redisTemplate.getStringSerializer();
                byte[] keys = serializer.serialize(key);
                Long result = redisConnection.incr(keys);
                if (expire > 0) {
                    redisConnection.expire(keys, expire);
                }
                return result;
            }
        });
        return result;
    }


    public String getString(String key){
        return stringRedisTemplate.opsForValue().get(key);
    }


}
