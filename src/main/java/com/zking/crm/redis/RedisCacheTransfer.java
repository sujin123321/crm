package com.zking.crm.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * @描述: 静态注入中间类，解决RedisCache中RedisTemplate的静态注入，从而使MyBatis实现第三方缓存
 */
//@Component
public class RedisCacheTransfer {

//    @Autowired
//    public void setRedisTemplate(JedisConnectionFactory jedisConnectionFactory) {
////        RedisCache.setRedisTemplate(redisTemplate);
//        RedisCache.setJedisConnectionFactory(jedisConnectionFactory);
//    }

//    @Autowired
    public void setRedisTemplate(JedisConnectionFactory jedisConnectionFactory) {
//        RedisCache.setRedisTemplate(redisTemplate);
        RedisCache.setJedisConnectionFactory(jedisConnectionFactory);
    }

}